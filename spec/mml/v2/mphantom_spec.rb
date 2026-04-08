# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mphantom do
  describe "parsing" do
    it "parses mphantom with child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mphantom><mi>x</mi></mphantom></math>"
      math = Mml::V2.parse(input)
      expect(math.mphantom_value).not_to be_empty
    end
  end
end
