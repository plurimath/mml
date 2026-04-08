# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Semantics do
  describe "parsing" do
    it "parses semantics with definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<semantics definitionURL="http://example.com/def">' \
              "<mi>x</mi></semantics></math>"
      math = Mml::V2.parse(input)
      expect(math.semantics_value).not_to be_empty
      expect(math.semantics_value.first.definition_url).to eq("http://example.com/def")
    end

    it "preserves semantics_encoding attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<semantics encoding="MathML-Content"><mi>x</mi></semantics></math>'
      math = Mml::V2.parse(input)
      expect(math.semantics_value.first.semantics_encoding).to eq("MathML-Content")
    end
  end
end
