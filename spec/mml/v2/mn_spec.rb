# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mn do
  describe "round-trip" do
    it "parses and serializes simple number" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>42</mn></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves value content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mn>3.14</mn></math>"
      math = Mml::V2.parse(input)
      expect(math.mn_value.first.value).to eq("3.14")
    end

    it "preserves mathvariant attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mn mathvariant="bold">1</mn></math>'
      math = Mml::V2.parse(input)
      expect(math.mn_value.first.mathvariant).to eq("bold")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mn mathcolor="blue">5</mn></math>'
      math = Mml::V2.parse(input)
      expect(math.mn_value.first.mathcolor).to eq("blue")
    end
  end
end
