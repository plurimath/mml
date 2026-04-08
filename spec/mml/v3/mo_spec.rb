# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mo do
  describe "round-trip" do
    it "parses and serializes plus operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>+</mo></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses minus operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>-</mo></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses parentheses" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>(</mo></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses invisible times" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>&#x2061;</mo></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts operator value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mo>+</mo></math>"
      math = Mml.parse(input)
      expect(math.mo_value.first.value).to eq("+")
    end

    it "preserves form attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo form="prefix">-</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.form).to eq("prefix")
    end

    it "preserves fence attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo fence="true">(</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.fence).to eq("true")
    end

    it "preserves separator attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo separator="true">,</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.separator).to eq("true")
    end

    it "preserves stretchy attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo stretchy="true">∪</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.stretchy).to eq("true")
    end

    it "preserves lspace attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo lspace="0.5em">+</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.lspace).to eq("0.5em")
    end

    it "preserves rspace attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo rspace="0.5em">+</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.rspace).to eq("0.5em")
    end

    it "preserves accent attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo accent="true">&#x203E;</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.accent).to eq("true")
    end

    it "preserves largeop attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo largeop="true">∫</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.largeop).to eq("true")
    end

    it "preserves minsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo minsize="1.5em">∪</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.minsize).to eq("1.5em")
    end

    it "preserves maxsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mo maxsize="3em">∪</mo></math>'
      math = Mml.parse(input)
      expect(math.mo_value.first.maxsize).to eq("3em")
    end
  end
end
