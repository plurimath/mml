# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mtext do
  describe "round-trip" do
    it "parses and serializes text content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>hello</mtext></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves value content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>some text</mtext></math>"
      math = Mml::V2.parse(input)
      expect(math.mtext_value.first.value).to eq("some text")
    end
  end
end
