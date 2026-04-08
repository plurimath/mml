# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Logic operators" do # rubocop:disable RSpec/DescribeClass
  describe "logic operators in apply" do
    it "parses and in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><and/><ci>P</ci><ci>Q</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses or in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><or/><ci>P</ci><ci>Q</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses not as unary operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><not/><ci>P</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses implies in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><implies/><ci>P</ci><ci>Q</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses forall with bvar" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><forall/><bvar><ci>x</ci></bvar>" \
              "<apply><eq/><ci>x</ci><ci>x</ci></apply></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses exists with bvar" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><exists/><bvar><ci>x</ci></bvar>" \
              "<apply><eq/><ci>x</ci><cn>0</cn></apply></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
