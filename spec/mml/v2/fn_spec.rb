# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Fn do
  describe "parsing" do
    it "parses fn with content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<fn><mi>f</mi></fn></math>"
      math = Mml::V2.parse(input)
      expect(math.fn_value).not_to be_empty
    end

    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<fn definitionURL="http://example.com/fn"><mi>g</mi></fn></math>'
      math = Mml::V2.parse(input)
      expect(math.fn_value.first.definition_url).to eq("http://example.com/fn")
    end

    it "preserves encoding attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<fn encoding="MathML"><mi>h</mi></fn></math>'
      math = Mml::V2.parse(input)
      expect(math.fn_value.first.encoding_value).to eq("MathML")
    end
  end
end
