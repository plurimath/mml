# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Msup do
  describe "round-trip" do
    it "parses and serializes simple superscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><msup><mi>x</mi><mn>2</mn></msup></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves superscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msup superscriptshift="0.3em">' \
              "<mi>x</mi><mn>2</mn></msup></math>"
      math = Mml::V4.parse(input)
      expect(math.msup_value.first.superscriptshift).to eq("0.3em")
    end
  end
end
