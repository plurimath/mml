# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Msqrt do
  describe "parsing" do
    it "parses msqrt with child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msqrt><mi>x</mi></msqrt></math>"
      math = Mml::V2.parse(input)
      expect(math.msqrt_value).not_to be_empty
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msqrt mathcolor="green"><mi>x</mi></msqrt></math>'
      math = Mml::V2.parse(input)
      expect(math.msqrt_value.first.mathcolor).to eq("green")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msqrt mathbackground="white"><mi>x</mi></msqrt></math>'
      math = Mml::V2.parse(input)
      expect(math.msqrt_value.first.mathbackground).to eq("white")
    end
  end
end
