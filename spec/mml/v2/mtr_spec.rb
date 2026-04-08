# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mtr do
  describe "parsing" do
    it "parses mtr with cells" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mtr><mtd><mi>x</mi></mtd></mtr></mtable></math>"
      math = Mml::V2.parse(input)
      expect(math.mtable_value.first.mtr_value).not_to be_empty
    end

    it "preserves rowalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mtable><mtr rowalign="top"><mtd><mi>x</mi></mtd></mtr></mtable></math>'
      math = Mml::V2.parse(input)
      expect(math.mtable_value.first.mtr_value.first.rowalign).to eq("top")
    end
  end
end
