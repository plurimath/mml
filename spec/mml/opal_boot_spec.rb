# frozen_string_literal: true

require "spec_helper"
require "pathname"

# Verifies the Opal boot file (lib/mml/opal.rb) stays in sync with
# the actual files in lib/mml/. Under Opal, autoloads do not
# lazy-execute, so the boot file eager-requires every entry point.
# If a new model file is added without regenerating the boot file,
# Opal users will hit NameError at runtime.
RSpec.describe "Mml Opal boot file" do # rubocop:disable RSpec/DescribeClass
  let(:gem_root) { Pathname.new(__dir__).join("..", "..").expand_path }
  let(:lib_root) { gem_root.join("lib") }
  let(:boot_file) { lib_root.join("mml", "opal.rb") }
  let(:boot_source) { boot_file.read }

  def all_mml_files
    Pathname.glob(lib_root.join("mml", "**", "*.rb")).map do |path|
      path.relative_path_from(lib_root).to_s.sub(/\.rb\z/, "")
    end.sort - ["mml/opal"]
  end

  def boot_required_files
    boot_source.scan(/^require\s+["']([^"']+)["']/).flatten
      .reject { |p| p == "lutaml/model" }
  end

  describe "static structure" do
    it "exists at lib/mml/opal.rb" do
      expect(boot_file).to exist
    end

    it "is syntactically valid Ruby" do
      expect do
        RubyVM::AbstractSyntaxTree.parse(boot_source)
      end.not_to raise_error
    end

    it "requires every mml/**/*.rb entry point so Opal eager-loads them" do
      missing = all_mml_files - boot_required_files
      expect(missing).to be_empty,
                         "The following files are not eager-required by " \
                         "lib/mml/opal.rb — Opal users will see " \
                         "NameError: #{missing.inspect}"
    end
  end

  describe "Opal builder compilation", :opal do
    it "compiles under Opal when external deps are stubbed" do
      require "opal"
      require "opal/builder"

      builder = Opal::Builder.new
      builder.append_paths(lib_root.to_s)
      builder.stubs += %w[
        lutaml/model
        lutaml/model/xml
        lutaml/model/json
        lutaml/model/yaml
        lutaml/model/key_value
        lutaml/model/toml
        lutaml/model/type
        lutaml/model/serialize
        ox
        nokogiri
        oga
        moxml
        moxml/compat/opal/moxml_boot
      ]
      builder.prerequired += %w[opal]

      expect { builder.build("mml/opal") }.not_to raise_error
    end
  end
end