# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Calculus operators" do # rubocop:disable RSpec/DescribeClass
  describe "calculus operators in apply" do
    it "parses int with bvar" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><int/><bvar><ci>x</ci></bvar>" \
              "<apply><power/><ci>x</ci><cn>2</cn></apply></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses diff in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><diff/><ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses partialdiff in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><partialdiff/><bvar><ci>x</ci></bvar><ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses limit with lowlimit" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><limit/><bvar><ci>x</ci></bvar>" \
              "<lowlimit><cn>0</cn></lowlimit>" \
              "<apply><sin/><ci>x</ci></apply></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses tendsto in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><tendsto/><ci>x</ci><cn>0</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
