# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mtr do
  describe "round-trip" do
    it "parses and serializes table row within table" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mtr><mtd><mi>a</mi></mtd>" \
              "<mtd><mi>b</mi></mtd></mtr>" \
              "</mtable></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves rowalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable><mtr rowalign="top">' \
              "<mtd><mi>a</mi></mtd>" \
              "</mtr></mtable></math>"
      math = Mml::V4.parse(input)
      expect(math.mtable_value.first.mtr_value.first.rowalign).to eq("top")
    end
  end
end
