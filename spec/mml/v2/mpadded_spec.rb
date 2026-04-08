# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mpadded do
  describe "parsing" do
    it "parses mpadded with child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mpadded><mi>x</mi></mpadded></math>"
      math = Mml::V2.parse(input)
      expect(math.mpadded_value).not_to be_empty
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded width="2em"><mi>x</mi></mpadded></math>'
      math = Mml::V2.parse(input)
      expect(math.mpadded_value.first.width).to eq("2em")
    end

    it "preserves height attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded height="1em"><mi>x</mi></mpadded></math>'
      math = Mml::V2.parse(input)
      expect(math.mpadded_value.first.height).to eq("1em")
    end

    it "preserves depth attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded depth="0.5em"><mi>x</mi></mpadded></math>'
      math = Mml::V2.parse(input)
      expect(math.mpadded_value.first.depth).to eq("0.5em")
    end
  end
end
