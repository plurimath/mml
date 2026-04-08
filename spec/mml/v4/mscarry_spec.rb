# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mscarry do
  describe "round-trip" do
    it "parses and serializes carry element within mstack" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><mscarry>" \
              "<mn>1</mn></mscarry></mstack></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves location attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><mscarry location="n">' \
              "<mn>1</mn></mscarry></mstack></math>"
      math = Mml::V4.parse(input)
      expect(math.mstack_value.first.mscarry_value.first.location).to eq("n")
    end
  end
end
