# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Maction do
  describe "round-trip" do
    it "parses and serializes action element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<maction actiontype=\"toggle\">" \
              "<mi>x</mi><mi>y</mi></maction></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves actiontype attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<maction actiontype=\"toggle\">" \
              "<mi>x</mi></maction></math>"
      math = Mml::V4.parse(input)
      expect(math.maction_value.first.actiontype).to eq("toggle")
    end
  end
end
