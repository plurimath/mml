# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Cn do
  describe "round-trip" do
    it "parses and serializes cn element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><cn>42</cn></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><cn>42</cn></math>'
      math = Mml::V4.parse(input)
      expect(math.cn_value.first.value).to eq(["42"])
    end
  end
end
