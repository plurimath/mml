# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Condition do
  describe "parsing" do
    it "parses condition in apply context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><forall/><bvar><ci>x</ci></bvar>" \
              "<condition><apply><gt/><ci>x</ci><cn>0</cn></apply></condition>" \
              "</apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
