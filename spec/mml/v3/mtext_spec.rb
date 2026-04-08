# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mtext do
  describe "round-trip" do
    it "parses and serializes simple text" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>text</mtext></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses text with spaces" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>Hello World</mtext></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses empty text" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext></mtext></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts text value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>sample text</mtext></math>"
      math = Mml.parse(input)
      expect(math.mtext_value.first.value).to eq("sample text")
    end

    it "preserves mathsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtext mathsize="small">small text</mtext></math>'
      math = Mml.parse(input)
      expect(math.mtext_value.first.mathsize).to eq("small")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtext mathcolor="green">green text</mtext></math>'
      math = Mml.parse(input)
      expect(math.mtext_value.first.mathcolor).to eq("green")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtext mathbackground="cyan">highlighted</mtext></math>'
      math = Mml.parse(input)
      expect(math.mtext_value.first.mathbackground).to eq("cyan")
    end

    it "parses multi-line text" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtext>Line 1&#x0A;Line 2</mtext></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
