# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Msgroup do
  describe "round-trip" do
    it "parses and serializes stack group within mstack" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msgroup><msrow>" \
              "<mn>1</mn><mo>+</mo><mn>2</mn>" \
              "</msrow></msgroup></mstack></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves position attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><msgroup position="1">' \
              "<msrow><mn>1</mn></msrow>" \
              "</msgroup></mstack></math>"
      math = Mml::V4.parse(input)
      expect(math.mstack_value.first.msgroup_value.first.position).to eq(1)
    end

    it "preserves shift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><msgroup shift="2">' \
              "<msrow><mn>1</mn></msrow>" \
              "</msgroup></mstack></math>"
      math = Mml::V4.parse(input)
      expect(math.mstack_value.first.msgroup_value.first.shift).to eq(2)
    end
  end
end
