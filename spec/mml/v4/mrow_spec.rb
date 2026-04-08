# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mrow do
  describe "round-trip" do
    it "parses and serializes mrow with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mrow><mi>x</mi><mo>+</mo><mn>1</mn></mrow></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nested mrow" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow><mi>x</mi><mo>+</mo>" \
              "<mrow><mi>a</mi><mo>/</mo>" \
              "<mi>b</mi></mrow></mrow></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mrow mathcolor="red"><mi>x</mi></mrow></math>'
      math = Mml::V4.parse(input)
      expect(math.mrow_value.first.mathcolor).to eq("red")
    end
  end
end
