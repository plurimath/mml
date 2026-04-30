# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mstyle do
  describe "round-trip" do
    it "parses and serializes empty mstyle" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstyle></mstyle></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses mstyle with child elements" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathcolor="red"><mi>y</mi></mstyle></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathcolor="red"><mi>y</mi></mstyle></math>'
      math = Mml.parse(input)
      expect(math.mstyle_value.first.mathcolor).to eq("red")
    end

    it "preserves displaystyle attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle displaystyle="true"><mi>y</mi></mstyle></math>'
      math = Mml.parse(input)
      expect(math.mstyle_value.first.displaystyle).to eq("true")
    end

    it "preserves scriptlevel attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle scriptlevel="1"><mi>y</mi></mstyle></math>'
      math = Mml.parse(input)
      expect(math.mstyle_value.first.scriptlevel).to eq("1")
    end

    it "preserves multiple style attributes" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathvariant="bold" mathcolor="blue"><mi>y</mi></mstyle></math>'
      math = Mml.parse(input)
      expect(math.mstyle_value.first.mathvariant).to eq("bold")
      expect(math.mstyle_value.first.mathcolor).to eq("blue")
    end

    it "parses mstyle with nested mfrac" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle displaystyle="true" scriptlevel="0"><mn>4</mn></mstyle></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
