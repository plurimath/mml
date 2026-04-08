# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Maction do
  describe "round-trip" do
    it "parses and serializes action element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maction actiontype="toggle"><mi>x</mi><mi>y</mi></maction></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves actiontype attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maction actiontype="toggle"><mi>x</mi></maction></math>'
      math = Mml.parse(input)
      expect(math.maction_value.first.actiontype).to eq("toggle")
    end

    it "preserves selection attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maction actiontype="toggle" selection="2"><mi>x</mi><mi>y</mi>' \
              "</maction></math>"
      math = Mml.parse(input)
      expect(math.maction_value.first.selection).to eq("2")
    end
  end
end
