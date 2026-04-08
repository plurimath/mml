# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mtd do
  describe "round-trip" do
    it "parses and serializes table cell within table row" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mtable><mtr><mtd><mi>a</mi></mtd></mtr></mtable></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
