# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Function operators" do # rubocop:disable RSpec/DescribeClass
  describe "function operators in apply" do
    it "parses compose in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><compose/><ci>f</ci><ci>g</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses domain in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><domain/><ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses codomain in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><codomain/><ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses image in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><image/><ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses ident as identity function" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><ident/></math>'
      math = Mml::V2.parse(input)
      expect(math.ident_value).not_to be_empty
    end
  end
end
