# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Degree do
  describe "parsing" do
    it "parses degree in apply context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><partialdiff/><bvar><ci>x</ci><degree><cn>2</cn></degree></bvar>" \
              "<ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
