# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mlabeledtr do
  describe "round-trip" do
    it "parses and serializes labeled table row within table" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mtable><mlabeledtr><mtd><mi>c</mi></mtd><mtd><mi>d</mi></mtd></mlabeledtr></mtable></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
