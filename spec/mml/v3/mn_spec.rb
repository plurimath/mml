# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mn do
  describe "round-trip" do
    it "parses and serializes simple number" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>2</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses decimal number" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>0.123</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses large number with separators" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>1,000,000</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses scientific notation" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>2.1e10</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses hexadecimal number" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>0xFFEF</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses roman numerals" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>MCMLXIX</mn></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts numeric value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>42</mn></math>"
      math = Mml.parse(input)
      expect(math.mn_value.first.value).to eq("42")
    end

    it "preserves mathsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mn mathsize="small">5</mn></math>'
      math = Mml.parse(input)
      expect(math.mn_value.first.mathsize).to eq("small")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mn mathcolor="blue">3.14</mn></math>'
      math = Mml.parse(input)
      expect(math.mn_value.first.mathcolor).to eq("blue")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mn mathbackground="lightgray">100</mn></math>'
      math = Mml.parse(input)
      expect(math.mn_value.first.mathbackground).to eq("lightgray")
    end
  end
end
