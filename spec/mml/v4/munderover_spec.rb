# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Munderover do
  describe "round-trip" do
    it "parses and serializes under-over script" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><munderover><mo>∫</mo><mi>a</mi><mi>b</mi></munderover></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves accent attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<munderover accent="true">' \
              "<mi>x</mi><mi>a</mi>" \
              "<mi>b</mi></munderover></math>"
      math = Mml::V4.parse(input)
      expect(math.munderover_value.first.accent).to eq("true")
    end

    it "preserves accentunder attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<munderover accentunder="true">' \
              "<mi>x</mi><mi>a</mi>" \
              "<mi>b</mi></munderover></math>"
      math = Mml::V4.parse(input)
      expect(math.munderover_value.first.accentunder).to eq("true")
    end
  end
end
