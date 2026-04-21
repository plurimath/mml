# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Msqrt do
  describe "round-trip" do
    it "parses and serializes square root" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msqrt><mi>x</mi></msqrt></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses square root of negative" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msqrt><mo>-</mo><mn>1</mn></msqrt></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nested square root" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msqrt><mi>x</mi><msqrt><mi>y</mi></msqrt></msqrt></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msqrt><mi>x</mi></msqrt></math>"
      math = Mml.parse(input)
      expect(math.msqrt_value.first.mi_value.first.value).to eq(["x"])
    end
  end
end
