# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mspace do
  describe "round-trip" do
    it "parses and serializes mspace" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mspace/></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace width="2em"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mspace_value.first.width).to eq("2em")
    end

    it "preserves height attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace height="1ex"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mspace_value.first.height).to eq("1ex")
    end

    it "preserves depth attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace depth="0.5ex"/></math>'
      math = Mml::V2.parse(input)
      expect(math.mspace_value.first.depth).to eq("0.5ex")
    end
  end
end
