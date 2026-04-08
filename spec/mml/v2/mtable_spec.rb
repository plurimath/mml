# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mtable do
  describe "parsing" do
    it "parses mtable with rows" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>"
      math = Mml::V2.parse(input)
      expect(math.mtable_value).not_to be_empty
    end

    it "preserves align attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable align="top"><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>'
      math = Mml::V2.parse(input)
      expect(math.mtable_value.first.align).to eq("top")
    end

    it "preserves rowalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable rowalign="center"><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>'
      math = Mml::V2.parse(input)
      expect(math.mtable_value.first.rowalign).to eq("center")
    end

    it "preserves columnalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable columnalign="left"><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>'
      math = Mml::V2.parse(input)
      expect(math.mtable_value.first.columnalign).to eq("left")
    end

    it "preserves frame attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable frame="solid"><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>'
      math = Mml::V2.parse(input)
      expect(math.mtable_value.first.frame).to eq("solid")
    end
  end
end
