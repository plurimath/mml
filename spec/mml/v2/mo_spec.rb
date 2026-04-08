# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mo do
  describe "round-trip" do
    it "parses and serializes simple operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>+</mo></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves value content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>∑</mo></math>"
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.value).to eq("∑")
    end

    it "preserves lspace attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo lspace="thinmathspace">+</mo></math>'
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.lspace).to eq("thinmathspace")
    end

    it "preserves rspace attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo rspace="thickmathspace">−</mo></math>'
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.rspace).to eq("thickmathspace")
    end

    it "preserves stretchy attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo stretchy="true">(</mo></math>'
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.stretchy).to eq("true")
    end

    it "preserves symmetric attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo symmetric="true">)</mo></math>'
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.symmetric).to eq("true")
    end

    it "preserves largeop attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo largeop="true">∫</mo></math>'
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.largeop).to eq("true")
    end

    it "preserves form attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo form="prefix">(</mo></math>'
      math = Mml::V2.parse(input)
      expect(math.mo_value.first.form).to eq("prefix")
    end
  end
end
