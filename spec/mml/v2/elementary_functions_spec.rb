# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Elementary functions" do # rubocop:disable RSpec/DescribeClass
  describe "trigonometric functions in apply" do
    it "parses sin in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><sin/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses cos in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><cos/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses tan in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><tan/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses arcsin in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><arcsin/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses exp in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><exp/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses ln in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><ln/><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses log with logbase" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><log/><logbase><cn>2</cn></logbase><ci>x</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
