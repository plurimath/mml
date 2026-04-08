# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mfenced do
  describe "round-trip" do
    it "parses and serializes fenced expression" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="(" close=")">' \
              "<mi>x</mi></mfenced></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves open attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="(" close=")">' \
              "<mi>x</mi></mfenced></math>"
      math = Mml::V4.parse(input)
      expect(math.mfenced_value.first.open).to eq("(")
    end

    it "preserves close attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfenced open="[" close="]">' \
              "<mi>x</mi></mfenced></math>"
      math = Mml::V4.parse(input)
      expect(math.mfenced_value.first.close).to eq("]")
    end
  end
end
