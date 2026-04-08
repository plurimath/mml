# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mspace do
  describe "round-trip" do
    it "parses and serializes space element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace width="1em"/></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace width="2em"/></math>'
      math = Mml.parse(input)
      expect(math.mspace_value.first.width).to eq("2em")
    end

    it "preserves height attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace height="1em"/></math>'
      math = Mml.parse(input)
      expect(math.mspace_value.first.height).to eq("1em")
    end

    it "preserves depth attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace depth="0.5em"/></math>'
      math = Mml.parse(input)
      expect(math.mspace_value.first.depth).to eq("0.5em")
    end

    it "preserves linebreak attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mspace width="1em" linebreak="newline"/></math>'
      math = Mml.parse(input)
      expect(math.mspace_value.first.linebreak).to eq("newline")
    end
  end
end
