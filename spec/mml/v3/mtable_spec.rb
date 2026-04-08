# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mtable do
  describe "round-trip" do
    it "parses and serializes simple table" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mtr><mtd><mi>a</mi></mtd></mtr></mtable></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses 3x3 identity matrix" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn>" \
              "</mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>" \
              "0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd>" \
              "<mn>1</mn></mtd></mtr></mtable></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves align attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable align="center"><mtr><mtd><mi>a</mi></mtd></mtr></mtable>' \
              "</math>"
      math = Mml.parse(input)
      expect(math.mtable_value.first.align).to eq("center")
    end

    it "preserves width attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable width="100px"><mtr><mtd><mi>a</mi></mtd></mtr></mtable></math>'
      math = Mml.parse(input)
      expect(math.mtable_value.first.width).to eq("100px")
    end
  end
end
