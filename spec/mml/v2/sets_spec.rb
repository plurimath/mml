# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Set operators" do # rubocop:disable RSpec/DescribeClass
  describe "set operators in apply" do
    it "parses set constructor" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<set><cn>1</cn><cn>2</cn><cn>3</cn></set></math>"
      math = Mml::V2.parse(input)
      expect(math.set_value).not_to be_empty
    end

    it "parses list constructor" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<list><cn>1</cn><cn>2</cn><cn>3</cn></list></math>"
      math = Mml::V2.parse(input)
      expect(math.list_value).not_to be_empty
    end

    it "parses union in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><union/><ci>A</ci><ci>B</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses intersect in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><intersect/><ci>A</ci><ci>B</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses in relation" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><in/><ci>x</ci><ci>S</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses notin relation" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><notin/><ci>x</ci><ci>S</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses subset relation" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><subset/><ci>A</ci><ci>B</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses prsubset relation" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><prsubset/><ci>A</ci><ci>B</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses setdiff in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><setdiff/><ci>A</ci><ci>B</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses card in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><card/><ci>S</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses cartesianproduct in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><cartesianproduct/><ci>A</ci><ci>B</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
