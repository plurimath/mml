# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Msub do
  describe "parsing" do
    it "parses msub with base and subscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<msub><mi>x</mi><mn>1</mn></msub></math>"
      math = Mml::V2.parse(input)
      expect(math.msub_value).not_to be_empty
    end

    it "preserves subscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msub subscriptshift="2px"><mi>x</mi><mn>1</mn></msub></math>'
      math = Mml::V2.parse(input)
      expect(math.msub_value.first.subscriptshift).to eq("2px")
    end
  end
end
