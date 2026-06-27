# frozen_string_literal: true

require "spec_helper"
require "pathname"

# Verifies the Opal boot file (lib/mml/opal.rb) stays in sync with the
# autoload declarations across the gem. Under Opal, autoloads do not
# lazy-execute, so the boot file eager-requires every entry point. If
# a new autoload is added without a matching `require` here, Opal users
# will hit NameError at runtime.
RSpec.describe "Mml Opal boot file" do # rubocop:disable RSpec/DescribeClass
  let(:gem_root) { Pathname.new(__dir__).join("..", "..").expand_path }
  let(:lib_root) { gem_root.join("lib") }
  let(:boot_file) { lib_root.join("mml", "opal.rb") }
  let(:boot_source) { boot_file.read }

  def autoload_paths_in(file)
    source = file.read
    pattern = /^\s*autoload\s+:[A-Za-z_][A-Za-z0-9_]*,?\s*["']([^"']+)["']/
    source.scan(pattern).flatten
  end

  def all_autoload_paths
    paths = []
    paths.concat(autoload_paths_in(lib_root.join("mml.rb")))
    paths.concat(autoload_paths_in(lib_root.join("mml", "v2.rb")))
    paths.concat(autoload_paths_in(lib_root.join("mml", "v3.rb")))
    paths.concat(autoload_paths_in(lib_root.join("mml", "v4.rb")))
    paths.uniq
  end

  def boot_required_paths
    boot_source.scan(/^require\s+["']([^"']+)["']/).flatten
  end

  describe "static structure" do
    it "exists at lib/mml/opal.rb" do
      expect(boot_file).to exist
    end

    it "is syntactically valid Ruby" do
      expect { RubyVM::AbstractSyntaxTree.parse(boot_source) }.not_to raise_error
    end

    it "requires every autoloaded entry point so Opal eager-loads them" do
      missing = all_autoload_paths - boot_required_paths
      expect(missing).to be_empty,
                         "The following autoloads are not eager-required by " \
                         "lib/mml/opal.rb — Opal users will see NameError: " \
                         "#{missing.inspect}"
    end

    it "only references files that exist on disk" do
      referenced = boot_required_paths.select { |p| p.start_with?("mml/") }
      missing = referenced.reject do |p|
        lib_root.join("#{p}.rb").exist? || lib_root.join(p.to_s).exist?
      end
      expect(missing).to be_empty,
                         "boot file references non-existent files: #{missing.inspect}"
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
