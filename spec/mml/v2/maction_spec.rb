# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Maction do
  describe "parsing" do
    it "parses maction with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maction actiontype="toggle"><mi>x</mi><mi>y</mi></maction></math>'
      math = Mml::V2.parse(input)
      expect(math.maction_value).not_to be_empty
    end

    it "preserves actiontype attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maction actiontype="tooltip"><mi>x</mi></maction></math>'
      math = Mml::V2.parse(input)
      expect(math.maction_value.first.actiontype).to eq("tooltip")
    end

    it "preserves selection attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maction actiontype="toggle" selection="2"><mi>x</mi><mi>y</mi></maction></math>'
      math = Mml::V2.parse(input)
      expect(math.maction_value.first.selection).to eq("2")
    end
  end
end
