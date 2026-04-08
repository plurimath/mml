# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Msrow do
  describe "round-trip" do
    it "parses and serializes stack row" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msrow><mn>1</mn><mo>+</mo><mn>2</mn></msrow></mstack></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves position attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><msrow position="2"><mn>1</mn></msrow></mstack></math>'
      math = Mml.parse(input)
      expect(math.mstack_value.first.msrow_value.first.position).to eq(2)
    end
  end
end
