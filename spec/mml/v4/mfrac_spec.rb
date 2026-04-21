# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mfrac do
  describe "round-trip" do
    it "parses and serializes simple fraction" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mfrac><mn>1</mn><mn>2</mn></mfrac></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves linethickness attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac linethickness="2px">' \
              "<mn>1</mn><mn>2</mn></mfrac></math>"
      math = Mml::V4.parse(input)
      expect(math.mfrac_value.first.linethickness).to eq("2px")
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mfrac><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml::V4.parse(input)
      expect(math.mfrac_value.first.mn_value.first.value).to eq(["1"])
      expect(math.mfrac_value.first.mn_value.last.value).to eq(["2"])
    end
  end
end
