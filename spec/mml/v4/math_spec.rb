# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Math do
  describe "round-trip" do
    it "parses and serializes empty math element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses math with single child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses math with intent attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML" ' \
              'intent="math:fraction">' \
              "<mfrac><mi>1</mi><mi>2</mi></mfrac></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves display attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML" ' \
              'display="block"><mi>x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.display).to eq("block")
    end

    it "extracts mi child element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi><mo>+</mo><mn>1</mn></math>"
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.value).to eq("x")
    end

    it "extracts mo child element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi><mo>+</mo><mn>1</mn></math>"
      math = Mml::V4.parse(input)
      expect(math.mo_value.first.value).to eq("+")
    end

    it "extracts mn child element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi><mo>+</mo><mn>1</mn></math>"
      math = Mml::V4.parse(input)
      expect(math.mn_value.first.value).to eq("1")
    end

    it "preserves alttext attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML" alttext="x plus 1">' \
              "<mi>x</mi><mo>+</mo><mn>1</mn></math>"
      math = Mml::V4.parse(input)
      expect(math.alttext).to eq("x plus 1")
    end

    it "round-trips alttext attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML" alttext="fraction one half">' \
              "<mfrac><mi>1</mi><mi>2</mi></mfrac></math>"
      math = Mml::V4.parse(input)
      output = math.to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
