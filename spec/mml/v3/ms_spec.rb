# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Ms do
  describe "round-trip" do
    it "parses and serializes string" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ms>hello</ms></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses empty string" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ms></ms></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts string value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ms>test</ms></math>"
      math = Mml.parse(input)
      expect(math.ms_value.first.value).to eq(["test"])
    end

    it "preserves mathsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms mathsize="big">message</ms></math>'
      math = Mml.parse(input)
      expect(math.ms_value.first.mathsize).to eq("big")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms mathcolor="red">error</ms></math>'
      math = Mml.parse(input)
      expect(math.ms_value.first.mathcolor).to eq("red")
    end

    it "preserves mathvariant attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms mathvariant="bold">warning</ms></math>'
      math = Mml.parse(input)
      expect(math.ms_value.first.mathvariant).to eq("bold")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms mathbackground="yellow">note</ms></math>'
      math = Mml.parse(input)
      expect(math.ms_value.first.mathbackground).to eq("yellow")
    end

    it "round-trips ms with quotes" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms>\"quoted\"</ms></math>'
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
