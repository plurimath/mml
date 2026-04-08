# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mrow do
  describe "parsing" do
    it "parses mrow with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow><mi>x</mi><mo>+</mo><mn>1</mn></mrow></math>"
      math = Mml::V2.parse(input)
      expect(math.mrow_value).not_to be_empty
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mrow mathcolor="red"><mi>x</mi></mrow></math>'
      math = Mml::V2.parse(input)
      expect(math.mrow_value.first.mathcolor).to eq("red")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mrow mathbackground="yellow"><mi>x</mi></mrow></math>'
      math = Mml::V2.parse(input)
      expect(math.mrow_value.first.mathbackground).to eq("yellow")
    end
  end
end
