# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mprescripts do
  describe "round-trip" do
    it "parses and serializes pre-scripts element within mmultiscripts" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mmultiscripts><mi>x</mi><mprescripts/></mmultiscripts></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
