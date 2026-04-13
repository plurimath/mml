# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Apply do
  describe "round-trip" do
    it "parses and serializes apply element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><plus/><ci>x</ci><cn>1</cn></apply></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nested apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><plus/><apply><sin/>" \
              "<ci>x</ci></apply><cn>5</cn></apply></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves id attribute on apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply id=\"eq1\"><plus/><ci>x</ci><cn>1</cn></apply></math>"
      math = Mml::V4.parse(input)
      expect(math.apply_value.first.id).to eq("eq1")
    end

    it "preserves class attribute on apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply class=\"equation\"><plus/><ci>x</ci><cn>1</cn></apply></math>"
      math = Mml::V4.parse(input)
      expect(math.apply_value.first.class_attr).to eq("equation")
    end

    it "preserves style attribute on apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply style=\"color:green\"><plus/><ci>x</ci><cn>1</cn></apply></math>"
      math = Mml::V4.parse(input)
      expect(math.apply_value.first.style_attr).to eq("color:green")
    end

    it "preserves href attribute on apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply href=\"http://ex.co\"><plus/><ci>x</ci><cn>1</cn></apply></math>"
      math = Mml::V4.parse(input)
      expect(math.apply_value.first.href).to eq("http://ex.co")
    end

    it "round-trips common attributes on apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply id=\"eq1\" class=\"equation\" style=\"color:green\" href=\"http://ex.co\">" \
              "<plus/><ci>x</ci><cn>1</cn></apply></math>"
      math = Mml::V4.parse(input)
      output = math.to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
