# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Msup do
  describe "round-trip" do
    it "parses and serializes simple superscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msup><mi>x</mi><mn>2</mn></msup></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses superscript with variable exponent" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msup><mi>x</mi><mi>n</mi></msup></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves superscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msup superscriptshift="0.3em"><mi>x</mi><mn>2</mn></msup></math>'
      math = Mml.parse(input)
      expect(math.msup_value.first.superscriptshift).to eq("0.3em")
    end

    it "parses nested superscript with parentheses" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msup><mrow><mo>(</mo><mrow><mi>x</mi><mo>+</mo><mn>1</mn></mrow><mo>" \
              ")</mo></mrow><mn>4</mn></msup></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msup><mi>x</mi><mn>2</mn></msup></math>"
      math = Mml.parse(input)
      expect(math.msup_value.first.mi_value.first.value).to eq("x")
      expect(math.msup_value.first.mn_value.first.value).to eq("2")
    end
  end
end
