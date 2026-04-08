# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mtext do
  describe "round-trip" do
    it "parses and serializes simple text" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mtext>text</mtext></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts text value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>sample text</mtext></math>"
      math = Mml::V4.parse(input)
      expect(math.mtext_value.first.value).to eq("sample text")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtext mathcolor="green">' \
              "green text</mtext></math>"
      math = Mml::V4.parse(input)
      expect(math.mtext_value.first.mathcolor).to eq("green")
    end
  end
end
