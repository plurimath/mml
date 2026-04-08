# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Msub do
  describe "round-trip" do
    it "parses and serializes simple subscript" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>a</mi><mn>1</mn></msub></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves subscriptshift attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<msub subscriptshift="0.5em">' \
              "<mi>x</mi><mn>1</mn></msub></math>"
      math = Mml::V4.parse(input)
      expect(math.msub_value.first.subscriptshift).to eq("0.5em")
    end
  end
end
