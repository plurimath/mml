# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Ms do
  describe "round-trip" do
    it "parses and serializes string" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><ms>hello</ms></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts string value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><ms>test</ms></math>'
      math = Mml::V4.parse(input)
      expect(math.ms_value.first.value).to eq(["test"])
    end

    it "preserves mathvariant attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ms mathvariant="bold">warning</ms></math>'
      math = Mml::V4.parse(input)
      expect(math.ms_value.first.mathvariant).to eq("bold")
    end
  end
end
