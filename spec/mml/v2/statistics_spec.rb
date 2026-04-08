# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Statistics operators" do # rubocop:disable RSpec/DescribeClass
  describe "statistics operators in apply" do
    it "parses mean in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><mean/><ci>X</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses sdev in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><sdev/><ci>X</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses variance in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><variance/><ci>X</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses median in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><median/><ci>X</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses mode in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><mode/><ci>X</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses moment in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><moment/><degree><cn>2</cn></degree>" \
              "<momentabout><mean/></momentabout><ci>X</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
