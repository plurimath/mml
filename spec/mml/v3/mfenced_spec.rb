# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mfenced do
  describe "round-trip" do
    it "parses and serializes fenced expression" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="(" close=")"><mi>x</mi></mfenced></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses fenced expression with multiple children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="(" close=")"><mi>x</mi><mo>+</mo><mi>y</mi></mfenced>' \
              "</math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves open attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="(" close=")"><mi>x</mi></mfenced></math>'
      math = Mml.parse(input)
      expect(math.mfenced_value.first.open).to eq("(")
    end

    it "preserves close attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="[" close="]"><mi>x</mi></mfenced></math>'
      math = Mml.parse(input)
      expect(math.mfenced_value.first.close).to eq("]")
    end

    it "preserves separators attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="(" close=")" separators=","><mi>x</mi></mfenced></math>'
      math = Mml.parse(input)
      expect(math.mfenced_value.first.separators).to eq(",")
    end
  end
end
