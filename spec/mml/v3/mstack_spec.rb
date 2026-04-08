# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Mstack do
  describe "round-trip" do
    it "parses and serializes stack element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msrow><mn>1</mn><mo>+</mo><mn>2</mn></msrow><msline/><msrow>" \
              "<mn>3</mn></msrow></mstack></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves align attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack align="right"><msrow><mn>1</mn></msrow></mstack></math>'
      math = Mml.parse(input)
      expect(math.mstack_value.first.align).to eq("right")
    end
  end
end
