# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Inverse do
  describe "parsing" do
    it "parses inverse in apply context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><inverse/><ci>f</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
