# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mtd do
  describe "parsing" do
    it "parses mtd with content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>"
      math = Mml::V2.parse(input)
      mtd = math.mtable_value.first.mtr_value.first.mtd_value.first
      expect(mtd).not_to be_nil
    end

    it "preserves columnalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable><mtr><mtd columnalign="right"><mi>x</mi></mtd></mtr></mtable></math>'
      math = Mml::V2.parse(input)
      mtd = math.mtable_value.first.mtr_value.first.mtd_value.first
      expect(mtd.columnalign).to eq("right")
    end
  end
end
