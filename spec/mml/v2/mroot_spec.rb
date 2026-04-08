# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mroot do
  describe "parsing" do
    it "parses mroot with base and index" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mroot><mi>x</mi><mn>3</mn></mroot></math>"
      math = Mml::V2.parse(input)
      expect(math.mroot_value).not_to be_empty
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mroot mathcolor="red"><mi>x</mi><mn>3</mn></mroot></math>'
      math = Mml::V2.parse(input)
      expect(math.mroot_value.first.mathcolor).to eq("red")
    end
  end
end
