# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mpadded do
  describe "round-trip" do
    it "parses and serializes padded element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded width="+0.5em"><mi>z</mi></mpadded></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded width="+0.5em"><mi>z</mi></mpadded></math>'
      math = Mml.parse(input)
      expect(math.mpadded_value.first.width).to eq("+0.5em")
    end

    it "preserves height attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded height="+1em"><mi>z</mi></mpadded></math>'
      math = Mml.parse(input)
      expect(math.mpadded_value.first.height).to eq("+1em")
    end

    it "preserves depth attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded depth="+0.5em"><mi>z</mi></mpadded></math>'
      math = Mml.parse(input)
      expect(math.mpadded_value.first.depth).to eq("+0.5em")
    end

    it "preserves lspace attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded lspace="+0.3em"><mi>z</mi></mpadded></math>'
      math = Mml.parse(input)
      expect(math.mpadded_value.first.lspace).to eq("+0.3em")
    end

    it "preserves voffset attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded voffset="-0.2em"><mi>z</mi></mpadded></math>'
      math = Mml.parse(input)
      expect(math.mpadded_value.first.voffset).to eq("-0.2em")
    end
  end
end
