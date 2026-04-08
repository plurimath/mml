# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Math do
  describe "round-trip" do
    it "parses and serializes empty math element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses math with single child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses math with multiple children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi><mo>+</mo><mn>1</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses math with nested elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mrow><mi>x</mi><mo>+</mo><mn>1</mn></mrow></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves display attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mi>x</mi></math>'
      math = Mml.parse(input)
      expect(math.display).to eq("block")
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi><mo>+</mo><mn>1</mn></math>"
      math = Mml.parse(input)
      expect(math.mi_value.first.value).to eq("x")
      expect(math.mo_value.first.value).to eq("+")
      expect(math.mn_value.first.value).to eq("1")
    end
  end
end
