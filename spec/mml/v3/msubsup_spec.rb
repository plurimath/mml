# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Msubsup do
  describe "round-trip" do
    it "parses and serializes subscript-superscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msubsup><mi>x</mi><mn>1</mn><mn>2</mn></msubsup></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses with variable indices" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msubsup><mi>x</mi><mi>i</mi><mi>j</mi></msubsup></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves subscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msubsup subscriptshift="0.5em" superscriptshift="0.5em"><mi>x</mi>' \
              "<mn>1</mn><mn>2</mn></msubsup></math>"
      math = Mml.parse(input)
      expect(math.msubsup_value.first.subscriptshift).to eq("0.5em")
    end

    it "preserves superscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msubsup superscriptshift="0.5em"><mi>x</mi><mn>1</mn><mn>2</mn>' \
              "</msubsup></math>"
      math = Mml.parse(input)
      expect(math.msubsup_value.first.superscriptshift).to eq("0.5em")
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msubsup><mi>x</mi><mn>1</mn><mn>2</mn></msubsup></math>"
      math = Mml.parse(input)
      expect(math.msubsup_value.first.mi_value.first.value).to eq("x")
      expect(math.msubsup_value.first.mn_value.first.value).to eq("1")
      expect(math.msubsup_value.first.mn_value.last.value).to eq("2")
    end
  end
end
