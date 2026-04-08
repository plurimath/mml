# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mfenced do
  describe "parsing" do
    it "parses mfenced with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfenced><mi>x</mi><mi>y</mi></mfenced></math>"
      math = Mml::V2.parse(input)
      expect(math.mfenced_value).not_to be_empty
    end

    it "preserves open attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="["><mi>x</mi></mfenced></math>'
      math = Mml::V2.parse(input)
      expect(math.mfenced_value.first.open).to eq("[")
    end

    it "preserves close attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced close="}"><mi>x</mi></mfenced></math>'
      math = Mml::V2.parse(input)
      expect(math.mfenced_value.first.close).to eq("}")
    end

    it "preserves separators attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced separators=";,"><mi>x</mi><mi>y</mi><mi>z</mi></mfenced></math>'
      math = Mml::V2.parse(input)
      expect(math.mfenced_value.first.separators).to eq(";,")
    end
  end
end
