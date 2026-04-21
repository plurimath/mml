# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Munder do
  describe "round-trip" do
    it "parses and serializes simple underscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<munder><mo>(</mo><mo>&#x005F;</mo></munder></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses integral with bounds" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<munder><mo>∫</mo><mi>a</mi></munder></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves accentunder attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<munder accentunder="true"><mi>x</mi><mo>&#x0302;</mo></munder></math>'
      math = Mml.parse(input)
      expect(math.munder_value.first.accentunder).to eq("true")
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<munder><mo>∫</mo><mi>a</mi></munder></math>"
      math = Mml.parse(input)
      expect(math.munder_value.first.mo_value.first.value).to eq("∫")
      expect(math.munder_value.first.mi_value.first.value).to eq(["a"])
    end
  end
end
