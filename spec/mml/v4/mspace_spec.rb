# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mspace do
  describe "round-trip" do
    it "parses and serializes space element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mspace width="1em"/></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mspace width="2em"/></math>'
      math = Mml::V4.parse(input)
      expect(math.mspace_value.first.width).to eq("2em")
    end
  end
end
