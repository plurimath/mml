# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Ci do
  describe "parsing" do
    it "parses ci with text content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ci>x</ci></math>"
      math = Mml::V2.parse(input)
      expect(math.ci_value).not_to be_empty
      expect(math.ci_value.first.value).to eq("x")
    end

    it "preserves type attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ci type="vector">v</ci></math>'
      math = Mml::V2.parse(input)
      expect(math.ci_value.first.type).to eq("vector")
    end

    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<ci definitionURL="http://example.com/var">x</ci></math>'
      math = Mml::V2.parse(input)
      expect(math.ci_value.first.definition_url).to eq("http://example.com/var")
    end
  end
end
