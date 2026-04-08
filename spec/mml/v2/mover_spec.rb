# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mover do
  describe "parsing" do
    it "parses mover with base and overscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mover><mi>x</mi><mo>^</mo></mover></math>"
      math = Mml::V2.parse(input)
      expect(math.mover_value).not_to be_empty
    end

    it "preserves accent attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mover accent="true"><mi>x</mi><mo>^</mo></mover></math>'
      math = Mml::V2.parse(input)
      expect(math.mover_value.first.accent).to eq("true")
    end
  end
end
