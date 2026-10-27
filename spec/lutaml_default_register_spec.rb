# frozen_string_literal: true

require "spec_helper"
require "mml/v2"

# rubocop:disable RSpec/SpecFilePathFormat
RSpec.describe Mml do
  # Every class inheriting from Lutaml::Model::Serializable in a version
  # namespace must define lutaml_default_register so that lutaml-model
  # resolves types (like :mglyph) in the correct versioned context.
  # Missing this method causes UnknownTypeError during from_xml parsing.
  shared_examples "lutaml_default_register coverage" do |mod, expected|
    it "all Serializable subclasses in #{mod} respond to lutaml_default_register returning #{expected}" do
      classes = mod.constants
        .map { |c| mod.const_get(c) }
        .select { |c| c.is_a?(Class) && c < Lutaml::Model::Serializable }

      missing = classes.reject { |c| c.respond_to?(:lutaml_default_register) }
      expect(missing).to be_empty,
                         "Classes in #{mod} missing lutaml_default_register: " \
                         "#{missing.map(&:name).join(', ')}"

      wrong = classes.reject { |c| c.lutaml_default_register == expected }
      expect(wrong).to be_empty,
                       "Classes in #{mod} returning wrong register: " \
                       "#{wrong.map do |c|
                         "#{c.name}=#{c.lutaml_default_register}"
                       end.join(', ')}"
    end
  end

  it_behaves_like "lutaml_default_register coverage", Mml::V4, :mml_v4
  it_behaves_like "lutaml_default_register coverage", Mml::V3, :mml_v3
  it_behaves_like "lutaml_default_register coverage", Mml::V2, :mml_v2

  # Integration: parsing <mi> containing <mglyph> is the scenario that
  # triggers UnknownTypeError when lutaml_default_register is missing.
  # Mi declares `attribute :mglyph_value, :mglyph` and `map_element "mglyph"`,
  # so lutaml-model must resolve the :mglyph type in the versioned register.
  [
    ["V4", Mml::V4],
    ["V3", Mml::V3],
    ["V2", Mml::V2],
  ].each do |label, parser|
    describe "#{label}: parsing mglyph inside mi" do
      let(:input) do
        '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
          '<mi><mglyph src="g.png" alt="g"/></mi></math>'
      end

      it "parses without UnknownTypeError" do
        expect { parser.parse(input) }.not_to raise_error
      end

      it "round-trips successfully" do
        output = parser.parse(input).to_xml
        expect(output).to be_xml_equivalent_to(input)
      end
    end

    # Also test mglyph inside mn (another leaf element with mglyph_value)
    describe "#{label}: parsing mglyph inside mn" do
      let(:input) do
        '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
          '<mn><mglyph src="n.png" alt="n"/></mn></math>'
      end

      it "parses without UnknownTypeError" do
        expect { parser.parse(input) }.not_to raise_error
      end

      it "round-trips successfully" do
        output = parser.parse(input).to_xml
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end
end
# rubocop:enable RSpec/SpecFilePathFormat
