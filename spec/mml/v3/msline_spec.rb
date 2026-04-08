# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Msline do
  describe "round-trip" do
    it "parses and serializes stack line" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msline/></mstack></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves position attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><msline position="1"/></mstack></math>'
      math = Mml.parse(input)
      expect(math.mstack_value.first.msline_value.first.position).to eq(1)
    end

    it "preserves length attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><msline length="3"/></mstack></math>'
      math = Mml.parse(input)
      expect(math.mstack_value.first.msline_value.first.length).to eq(3)
    end
  end
end
