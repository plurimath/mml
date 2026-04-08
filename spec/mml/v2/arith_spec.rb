# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Arithmetic operators" do # rubocop:disable RSpec/DescribeClass
  describe "arithmetic operators in apply" do
    it "parses plus in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><plus/><cn>1</cn><cn>2</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses times in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><times/><ci>x</ci><ci>y</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses divide in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><divide/><ci>x</ci><cn>2</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses power in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><power/><ci>x</ci><cn>2</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses factorial as unary operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><factorial/><cn>5</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses abs as unary operator" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><abs/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses root with degree" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><root/><degree><cn>3</cn></degree><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses sum with bounds" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><sum/><bvar><ci>i</ci></bvar>" \
              "<lowlimit><cn>0</cn></lowlimit>" \
              "<uplimit><cn>10</cn></uplimit>" \
              "<apply><power/><ci>i</ci><cn>2</cn></apply></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
