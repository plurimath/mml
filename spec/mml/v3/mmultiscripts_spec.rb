# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mmultiscripts do
  describe "round-trip" do
    it "parses and serializes multi-scripts element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mmultiscripts><mi>x</mi><mprescripts/><none/><mn>2</mn>" \
              "</mmultiscripts></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses with post-scripts" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mmultiscripts><mi>x</mi><mn>1</mn><mn>2</mn></mmultiscripts></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
