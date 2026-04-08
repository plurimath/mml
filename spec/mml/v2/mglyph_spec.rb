# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mglyph do
  describe "parsing" do
    it "parses mglyph with src and alt" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="image.png" alt="glyph"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mglyph_value).not_to be_empty
    end

    it "preserves src attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="image.png" alt="glyph"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mglyph_value.first.src).to eq("image.png")
    end

    it "preserves alt attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="image.png" alt="glyph"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mglyph_value.first.alt).to eq("glyph")
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="image.png" alt="g" width="20px"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mglyph_value.first.width).to eq("20px")
    end

    it "preserves height attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mglyph src="image.png" alt="g" height="15px"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mglyph_value.first.height).to eq("15px")
    end
  end
end
