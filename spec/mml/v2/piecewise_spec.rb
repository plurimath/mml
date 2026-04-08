# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Piecewise do
  describe "parsing" do
    it "parses piecewise with piece and otherwise" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<piecewise>" \
              "<piece><ci>x</ci><apply><lt/><ci>x</ci><cn>0</cn></apply></piece>" \
              "<otherwise><cn>0</cn></otherwise>" \
              "</piecewise></math>"
      math = Mml::V2.parse(input)
      expect(math.piecewise_value).not_to be_empty
    end
  end
end
