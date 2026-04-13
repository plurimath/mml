# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mstyle do
  describe "round-trip" do
    it "parses and serializes mstyle with child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathcolor="red">' \
              "<mi>y</mi></mstyle></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathcolor="red">' \
              "<mi>y</mi></mstyle></math>"
      math = Mml::V4.parse(input)
      expect(math.mstyle_value.first.mathcolor).to eq("red")
    end

    it "preserves displaystyle attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle displaystyle="true">' \
              "<mi>y</mi></mstyle></math>"
      math = Mml::V4.parse(input)
      expect(math.mstyle_value.first.displaystyle).to eq("true")
    end

    it "preserves mathsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathsize="big">' \
              "<mi>y</mi></mstyle></math>"
      math = Mml::V4.parse(input)
      expect(math.mstyle_value.first.mathsize).to eq("big")
    end
  end
end
