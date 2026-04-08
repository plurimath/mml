# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mglyph do
  describe "round-trip" do
    it "parses and serializes glyph element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="glyph.png" alt="glyph"/></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves src attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="glyph.png" alt="glyph"/></math>'
      math = Mml::V4.parse(input)
      expect(math.mglyph_value.first.src).to eq("glyph.png")
    end
  end
end
