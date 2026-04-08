# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::A do
  describe "round-trip" do
    it "parses and serializes anchor element within math" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<a href="#ref"><mi>x</mi></a></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves href attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><a href="https://example.org"><mi>x</mi></a></math>'
      math = Mml::V4.parse(input)
      expect(math.a_value.first.href).to eq("https://example.org")
    end

    it "preserves hreflang attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<a hreflang="en"><mi>x</mi></a></math>'
      math = Mml::V4.parse(input)
      expect(math.a_value.first.hreflang).to eq("en")
    end

    it "handles mixed content with multiple children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<a href="#ref"><mi>f</mi><mo>(</mo>' \
              "<mi>x</mi><mo>)</mo></a></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "handles anchor within mrow" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mrow><a href="#p1"><mi>x</mi></a>' \
              "<mo>+</mo><mn>1</mn></mrow></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
