# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mover do
  describe "round-trip" do
    it "parses and serializes simple overscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mover><mo>)</mo><mo>&#x203E;</mo></mover></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses integral with upper bound" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mover><mo>∫</mo><mi>b</mi></mover></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves accent attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mover accent="true"><mi>x</mi><mo>&#x005E;</mo></mover></math>'
      math = Mml.parse(input)
      expect(math.mover_value.first.accent).to eq("true")
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mover><mo>∫</mo><mi>b</mi></mover></math>"
      math = Mml.parse(input)
      expect(math.mover_value.first.mo_value.first.value).to eq("∫")
      expect(math.mover_value.first.mi_value.first.value).to eq("b")
    end
  end
end
