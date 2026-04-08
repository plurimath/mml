# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Lambda do
  describe "parsing" do
    it "parses lambda with bvar and body" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<lambda><bvar><ci>x</ci></bvar><apply><plus/><ci>x</ci><cn>1</cn></apply>" \
              "</lambda></math>"
      math = Mml::V2.parse(input)
      expect(math.lambda_value).not_to be_empty
    end
  end
end
