# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mmultiscripts do
  describe "parsing" do
    it "parses mmultiscripts with base and postscripts" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mmultiscripts><mi>x</mi><mn>1</mn><mn>2</mn></mmultiscripts></math>"
      math = Mml::V2.parse(input)
      expect(math.mmultiscripts_value).not_to be_empty
    end

    it "parses mmultiscripts with mprescripts" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mmultiscripts><mi>x</mi><mn>1</mn><mn>2</mn>" \
              "<mprescripts/><mn>3</mn><mn>4</mn></mmultiscripts></math>"
      math = Mml::V2.parse(input)
      expect(math.mmultiscripts_value).not_to be_empty
    end

    it "parses mmultiscripts with none placeholders" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mmultiscripts><mi>x</mi><none/><mn>2</mn></mmultiscripts></math>"
      math = Mml::V2.parse(input)
      expect(math.mmultiscripts_value).not_to be_empty
    end
  end
end
