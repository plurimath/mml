# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Menclose do
  describe "round-trip" do
    it "parses and serializes enclose element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<menclose notation="circle">' \
              "<mi>r</mi></menclose></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves notation attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<menclose notation="circle">' \
              "<mi>r</mi></menclose></math>"
      math = Mml::V4.parse(input)
      expect(math.menclose_value.first.notation).to eq("circle")
    end
  end
end
