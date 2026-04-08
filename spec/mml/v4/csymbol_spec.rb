# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Csymbol do
  describe "round-trip" do
    it "parses and serializes csymbol element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><csymbol>sin</csymbol></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<csymbol definitionURL="http://example.org/def">' \
              "sin</csymbol></math>"
      math = Mml::V4.parse(input)
      expect(math.csymbol_value.first.definition_url).to eq("http://example.org/def")
    end
  end
end
