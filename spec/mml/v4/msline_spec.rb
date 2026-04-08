# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Msline do
  describe "round-trip" do
    it "parses and serializes stack line within mstack" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mstack><msline/></mstack></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves position attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><msline position="1"/>' \
              "</mstack></math>"
      math = Mml::V4.parse(input)
      expect(math.mstack_value.first.msline_value.first.position).to eq(1)
    end
  end
end
