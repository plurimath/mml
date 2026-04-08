# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mrow do
  describe "round-trip" do
    it "parses and serializes empty mrow" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow></mrow></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses mrow with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow><mi>x</mi><mo>+</mo><mn>1</mn></mrow></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nested mrow" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow><mi>x</mi><mo>+</mo><mrow><mi>a</mi><mo>/</mo><mi>b</mi></mrow>" \
              "</mrow></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mrow mathcolor="red"><mi>x</mi></mrow></math>'
      math = Mml.parse(input)
      expect(math.mrow_value.first.mathcolor).to eq("red")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mrow mathbackground="yellow"><mi>x</mi></mrow></math>'
      math = Mml.parse(input)
      expect(math.mrow_value.first.mathbackground).to eq("yellow")
    end

    it "parses mrow with invisible times" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow><mi>sin</mi><mo>&#x2061;</mo><mi>x</mi></mrow></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
