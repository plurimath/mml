# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Merror do
  describe "round-trip" do
    it "parses and serializes error element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<merror><mtext>Error</mtext></merror></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<merror><mtext>Error message</mtext></merror></math>"
      math = Mml.parse(input)
      expect(math.merror_value.first.mtext_value.first.value)
        .to eq("Error message")
    end

    it "parses error with complex children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<merror><mi>x</mi><mo>!</mo></merror></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
