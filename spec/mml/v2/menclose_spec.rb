# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Menclose do
  describe "parsing" do
    it "parses menclose with child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<menclose><mi>x</mi></menclose></math>"
      math = Mml::V2.parse(input)
      expect(math.menclose_value).not_to be_empty
    end

    it "preserves notation attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<menclose notation="box"><mi>x</mi></menclose></math>'
      math = Mml::V2.parse(input)
      expect(math.menclose_value.first.notation).to eq("box")
    end
  end
end
