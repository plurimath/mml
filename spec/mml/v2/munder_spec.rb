# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Munder do
  describe "parsing" do
    it "parses munder with base and underscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<munder><mi>x</mi><mo>¯</mo></munder></math>"
      math = Mml::V2.parse(input)
      expect(math.munder_value).not_to be_empty
    end

    it "preserves accentunder attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<munder accentunder="true"><mi>x</mi><mo>¯</mo></munder></math>'
      math = Mml::V2.parse(input)
      expect(math.munder_value.first.accentunder).to eq("true")
    end
  end
end
