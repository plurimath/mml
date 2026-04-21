# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Msub do
  describe "round-trip" do
    it "parses and serializes simple subscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msub><mi>a</mi><mn>1</mn></msub></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses subscript with multiple characters" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msub><mi>m</mi><mrow><mn>1</mn><mo>&#x2063;</mo><mn>2</mn></mrow>" \
              "</msub></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves subscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msub subscriptshift="0.5em"><mi>x</mi><mn>1</mn></msub></math>'
      math = Mml.parse(input)
      expect(math.msub_value.first.subscriptshift).to eq("0.5em")
    end

    it "extracts child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msub><mi>x</mi><mn>1</mn></msub></math>"
      math = Mml.parse(input)
      expect(math.msub_value.first.mi_value.first.value).to eq(["x"])
      expect(math.msub_value.first.mn_value.first.value).to eq(["1"])
    end
  end
end
