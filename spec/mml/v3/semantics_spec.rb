# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Semantics do
  describe "round-trip" do
    it "parses and serializes semantics element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<semantics><apply><plus/><apply><sin/><ci>x</ci></apply><cn>5</cn>" \
              '</apply><annotation-xml encoding="MathML-Presentation"><mrow><mi>' \
              "sin</mi><mo>&#x2061;</mo><mi>x</mi></mrow><mo>+</mo><mn>5</mn>" \
              "</annotation-xml></semantics></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    # definition_url attribute is not defined in Base::Semantics
    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<semantics definitionURL="http://example.org/def"><ci>x</ci>' \
              "</semantics></math>"
      math = Mml.parse(input)
      expect(math.semantics_value.first.definition_url)
        .to eq("http://example.org/def")
    end

    # encoding attribute is not defined in Base::Semantics
    it "preserves encoding attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<semantics encoding="MathML-Presentation"><ci>x</ci></semantics>' \
              "</math>"
      math = Mml.parse(input)
      expect(math.semantics_value.first.semantics_encoding).to eq("MathML-Presentation")
    end
  end
end
