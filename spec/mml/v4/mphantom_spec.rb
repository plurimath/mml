# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mphantom do
  describe "round-trip" do
    it "parses and serializes phantom element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mphantom><mi>hidden</mi></mphantom></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
