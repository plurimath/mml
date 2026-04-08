# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Munderover do
  describe "parsing" do
    it "parses munderover with base, underscript, and overscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<munderover><mo>∑</mo><mi>i</mi><mi>n</mi></munderover></math>"
      math = Mml::V2.parse(input)
      expect(math.munderover_value).not_to be_empty
    end

    it "preserves accent attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<munderover accent="true"><mi>x</mi><mo>¯</mo><mo>^</mo></munderover></math>'
      math = Mml::V2.parse(input)
      expect(math.munderover_value.first.accent).to eq("true")
    end

    it "preserves accentunder attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<munderover accentunder="true"><mi>x</mi><mo>¯</mo><mo>^</mo></munderover></math>'
      math = Mml::V2.parse(input)
      expect(math.munderover_value.first.accentunder).to eq("true")
    end
  end
end
