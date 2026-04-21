# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mfrac do
  describe "round-trip" do
    it "parses and serializes simple fraction" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfrac><mn>1</mn><mn>2</mn></mfrac></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses fraction with variables" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfrac><mi>a</mi><mi>b</mi></mfrac></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nested fraction" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfrac><mrow><mn>1</mn><mo>+</mo><mi>x</mi></mrow><mi>b</mi></mfrac>" \
              "</math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves linethickness attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac linethickness="2px"><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml.parse(input)
      expect(math.mfrac_value.first.linethickness).to eq("2px")
    end

    it "parses fraction with numerator and denominator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfrac><mn>1</mn><mn>2</mn></mfrac></math>"
      math = Mml.parse(input)
      expect(math.mfrac_value.first.mn_value.first.value).to eq(["1"])
      expect(math.mfrac_value.first.mn_value.last.value).to eq(["2"])
    end

    it "parses complex nested fraction" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfrac><mrow><mn>1</mn><mo>+</mo><msqrt><mn>5</mn></msqrt></mrow><mn>" \
              "2</mn></mfrac></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
