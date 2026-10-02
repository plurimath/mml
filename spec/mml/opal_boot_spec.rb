# frozen_string_literal: true

require "spec_helper"
require "open3"
require "pathname"
require "rbconfig"

# Verifies the Opal boot file (lib/mml/opal.rb) stays in sync with the
# autoload declarations across the gem. Under Opal, autoloads do not
# lazy-execute, so the boot file eager-requires every entry point. If
# a new autoload is added without a matching `require` here, Opal users
# will hit NameError at runtime.

# Helpers for reading autoload declarations and the boot file's requires.
module OpalBootSpecHelpers
  AUTOLOAD_PATTERN =
    /^\s*autoload\s+:[A-Za-z_][A-Za-z0-9_]*,?\s*["']([^"']+)["']/

  # Eight threads race V2.register_models!, then one more registration
  # runs alone; prints both register_model call counts.
  RACE_SCRIPT = <<~RUBY
    require "mml"
    Mml.opal_boot! # no load-time registration; the threads do it
    calls = 0
    lock = Mutex.new
    Mml::ContextConfiguration.prepend(Module.new do
      define_method(:register_model) do |klass, id:|
        lock.synchronize { calls += 1 }
        Thread.pass
        super(klass, id: id)
      end
    end)
    Mml::V2::Math
    Array.new(8) { Thread.new { Mml::V2.register_models! } }.each(&:join)
    once = calls
    Mml::V2.instance_variable_set(:@models_registered, nil)
    Mml::V2.register_models!
    puts once, calls - once
  RUBY

  # Autoload targets in +file+, as require paths relative to lib/.
  # A "#{__dir__}/x" target resolves against the declaring file's directory.
  def autoload_paths_in(file)
    dir = file.dirname.relative_path_from(lib_root).to_s
    file.read.scan(AUTOLOAD_PATTERN).flatten.map do |path|
      path.sub('#{__dir__}', dir) # rubocop:disable Lint/InterpolationCheck
    end
  end

  # Every file under lib/ that declares an autoload, except the boot file.
  def autoload_files
    lib_root.glob("**/*.rb").reject { |f| f == boot_file }.select do |f|
      f.read.match?(AUTOLOAD_PATTERN)
    end
  end

  def all_autoload_paths
    autoload_files.flat_map { |f| autoload_paths_in(f) }.uniq
  end

  # Every lib/mml file as a require path, except the boot file itself.
  def all_mml_paths
    lib_root.glob("mml/**/*.rb").map do |f|
      f.relative_path_from(lib_root).to_s.delete_suffix(".rb")
    end - ["mml/opal"]
  end

  def boot_required_paths
    boot_source.scan(/^require\s+["']([^"']+)["']/).flatten
  end
end

RSpec.describe "Mml Opal boot file" do # rubocop:disable RSpec/DescribeClass
  let(:gem_root) { Pathname.new(__dir__).join("..", "..").expand_path }
  let(:lib_root) { gem_root.join("lib") }
  let(:boot_file) { lib_root.join("mml", "opal.rb") }
  let(:boot_source) { boot_file.read }

  include OpalBootSpecHelpers

  describe "static structure" do
    it "exists at lib/mml/opal.rb" do
      expect(boot_file).to exist
    end

    it "is syntactically valid Ruby" do
      expect { RubyVM::AbstractSyntaxTree.parse(boot_source) }.not_to raise_error
    end

    it "scans every lib file that declares autoloads" do
      scanned = autoload_files.map { |f| f.relative_path_from(lib_root).to_s }
      expect(scanned).to include("mml.rb", "mml/base.rb", "mml/v2.rb",
                                 "mml/v3.rb", "mml/v4.rb")
    end

    it "requires every autoloaded entry point so Opal eager-loads them" do
      missing = all_autoload_paths - boot_required_paths
      expect(missing).to be_empty,
                         "The following autoloads are not eager-required by " \
                         "lib/mml/opal.rb — Opal users will see NameError: " \
                         "#{missing.inspect}"
    end

    it "requires every file under lib/mml" do
      missing = all_mml_paths - boot_required_paths
      expect(missing).to be_empty,
                         "lib/mml/opal.rb does not require: #{missing.inspect}"
    end

    it "only references files that exist on disk" do
      referenced = boot_required_paths.select { |p| p.start_with?("mml/") }
      missing = referenced.reject do |p|
        lib_root.join("#{p}.rb").exist? || lib_root.join(p.to_s).exist?
      end
      expect(missing).to be_empty,
                         "boot file references non-existent files: #{missing.inspect}"
    end

    it "registers every version after its last element file" do
      %w[V2 V3 V4].each do |version|
        call_index = boot_source.index("Mml::#{version}.register_models!")
        expect(call_index).not_to be_nil,
                                  "boot file must call Mml::#{version}.register_models!"

        last_element = boot_source.rindex(%r{require "mml/#{version.downcase}/[a-z]})
        expect(call_index).to be > last_element
      end
    end

    it "requires version module files (mml/v{2,3,4}) after their elements" do
      %w[mml/v2 mml/v3 mml/v4].each do |version_path|
        version_index = boot_source.index(%(require "#{version_path}"))
        expect(version_index).not_to be_nil,
                                     "boot file must require #{version_path}"

        element_require_regex = /require "#{Regexp.escape(version_path)}\/[a-z]/
        last_element_index = boot_source.rindex(element_require_regex)
        next unless last_element_index

        expect(last_element_index).to be < version_index,
                                      "#{version_path} must be required AFTER " \
                                      "its element files"
      end
    end
  end

  describe "requiring the boot file on MRI" do
    # Runs in a fresh process: the boot file's flag and each version's
    # registration are process-wide.
    def run_boot(preload)
      script = <<~RUBY
        require "mml"
        counts = Hash.new(0)
        Mml::ContextConfiguration.prepend(Module.new do
          define_method(:register_model) do |klass, id:|
            counts[[self, id]] += 1
            super(klass, id: id)
          end
        end)
        #{preload}
        require "mml/opal"
        xml = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>'
        %w[V2 V3 V4].each { |v| Mml.const_get(v)::Math.from_xml(xml) }
        puts counts.size, counts.values.max
      RUBY
      Open3.capture2e(RbConfig.ruby, "-I#{lib_root}", "-e", script)
    end

    ["", "Mml::V2; Mml::V3; Mml::V4"].each do |preload|
      it "loads and registers each model once (preload: #{preload.inspect})" do
        output, status = run_boot(preload)
        expect(status).to be_success, output
        registered, max_per_id = output.lines.map(&:to_i)
        expect(registered).to be_positive
        expect(max_per_id).to eq(1)
      end
    end
  end

  describe "concurrent registration on MRI" do
    it "registers each model once when threads race register_models!" do
      output, status = Open3.capture2e(RbConfig.ruby, "-I#{lib_root}",
                                       "-e", OpalBootSpecHelpers::RACE_SCRIPT)
      expect(status).to be_success, output
      racing, single = output.lines.map(&:to_i)
      expect(single).to be_positive
      expect(racing).to eq(single)
    end
  end

  describe "Opal builder compilation", :opal do
    it "compiles under Opal when external deps are stubbed" do
      require "opal"
      require "opal/builder"

      builder = Opal::Builder.new
      builder.append_paths(lib_root.to_s)
      # Stub native-only deps that have no Opal-compatible build at this layer.
      # The gem's Opal consumer (plurimath-js) provides these at runtime.
      builder.stubs += %w[lutaml/model]

      expect { builder.build("mml/opal") }.not_to raise_error
    end
  end
end
