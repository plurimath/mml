# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mglyph do
  describe "round-trip" do
    it "parses and serializes glyph element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="glyph.png" alt="glyph"/></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves src attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="glyph.png" alt="glyph"/></math>'
      math = Mml.parse(input)
      expect(math.mglyph_value.first.src).to eq("glyph.png")
    end

    it "preserves alt attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="glyph.png" alt="glyph"/></math>'
      math = Mml.parse(input)
      expect(math.mglyph_value.first.alt).to eq("glyph")
    end
  end
end
