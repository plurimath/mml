# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mscarry do
  describe "round-trip" do
    it "parses and serializes carry element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><mscarries><mscarry><mn>1</mn></mscarry></mscarries></mstack>" \
              "</math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves location attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><mscarries><mscarry location="n"><mn>1</mn></mscarry>' \
              "</mscarries></mstack></math>"
      math = Mml.parse(input)
      expect(math.mstack_value.first.mscarries_value.first.mscarry_value.first.location)
        .to eq("n")
    end
  end
end
