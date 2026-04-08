# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Msup do
  describe "parsing" do
    it "parses msup with base and superscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msup><mi>x</mi><mn>2</mn></msup></math>"
      math = Mml::V2.parse(input)
      expect(math.msup_value).not_to be_empty
    end

    it "preserves superscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msup superscriptshift="3px"><mi>x</mi><mn>2</mn></msup></math>'
      math = Mml::V2.parse(input)
      expect(math.msup_value.first.superscriptshift).to eq("3px")
    end
  end
end
