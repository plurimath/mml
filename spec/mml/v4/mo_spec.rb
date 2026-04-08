# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mo do
  describe "round-trip" do
    it "parses and serializes plus operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mo>+</mo></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses minus operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mo>-</mo></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts operator value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mo>+</mo></math>'
      math = Mml::V4.parse(input)
      expect(math.mo_value.first.value).to eq("+")
    end

    it "preserves form attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mo form="prefix">-</mo></math>'
      math = Mml::V4.parse(input)
      expect(math.mo_value.first.form).to eq("prefix")
    end

    it "preserves stretchy attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mo stretchy="true">∪</mo></math>'
      math = Mml::V4.parse(input)
      expect(math.mo_value.first.stretchy).to eq("true")
    end
  end
end
