# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Ms do
  describe "round-trip" do
    it "parses and serializes string literal" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ms>test</ms></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves value content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ms>hello</ms></math>"
      math = Mml::V2.parse(input)
      expect(math.ms_value.first.value).to eq("hello")
    end

    it "preserves lquote attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms lquote="«">test</ms></math>'
      math = Mml::V2.parse(input)
      expect(math.ms_value.first.lquote).to eq("«")
    end

    it "preserves rquote attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms rquote="»">test</ms></math>'
      math = Mml::V2.parse(input)
      expect(math.ms_value.first.rquote).to eq("»")
    end
  end
end
