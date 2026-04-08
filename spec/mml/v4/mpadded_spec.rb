# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mpadded do
  describe "round-trip" do
    it "parses and serializes padded element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded width="+0.5em">' \
              "<mi>z</mi></mpadded></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mpadded width="+0.5em">' \
              "<mi>z</mi></mpadded></math>"
      math = Mml::V4.parse(input)
      expect(math.mpadded_value.first.width).to eq("+0.5em")
    end
  end
end
