# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mroot do
  describe "round-trip" do
    it "parses and serializes cube root" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mroot><mi>x</mi><mn>3</mn></mroot></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nth root" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mroot><mi>x</mi><mi>n</mi></mroot></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses root with complex radicand" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mroot><mrow><mi>x</mi><mo>+</mo><mn>1</mn></mrow><mn>3</mn></mroot>" \
              "</math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mroot><mi>x</mi><mn>3</mn></mroot></math>"
      math = Mml.parse(input)
      expect(math.mroot_value.first.mi_value.first.value).to eq("x")
      expect(math.mroot_value.first.mn_value.first.value).to eq("3")
    end
  end
end
