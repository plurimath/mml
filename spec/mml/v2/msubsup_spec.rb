# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Msubsup do
  describe "parsing" do
    it "parses msubsup with base, subscript, and superscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msubsup><mi>x</mi><mn>1</mn><mn>2</mn></msubsup></math>"
      math = Mml::V2.parse(input)
      expect(math.msubsup_value).not_to be_empty
    end

    it "preserves subscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msubsup subscriptshift="2px"><mi>x</mi><mn>1</mn><mn>2</mn></msubsup></math>'
      math = Mml::V2.parse(input)
      expect(math.msubsup_value.first.subscriptshift).to eq("2px")
    end

    it "preserves superscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msubsup superscriptshift="3px"><mi>x</mi><mn>1</mn><mn>2</mn></msubsup></math>'
      math = Mml::V2.parse(input)
      expect(math.msubsup_value.first.superscriptshift).to eq("3px")
    end
  end
end
