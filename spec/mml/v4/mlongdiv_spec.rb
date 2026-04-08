# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mlongdiv do
  describe "round-trip" do
    it "parses and serializes long division element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mlongdiv><msgroup><msrow>" \
              "<mn>1</mn><mo>+</mo><mn>2</mn>" \
              "</msrow></msgroup></mlongdiv></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves longdivstyle attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mlongdiv longdivstyle="right">' \
              "<msgroup><msrow><mn>1</mn>" \
              "</msrow></msgroup></mlongdiv></math>"
      math = Mml::V4.parse(input)
      expect(math.mlongdiv_value.first.longdivstyle).to eq("right")
    end
  end
end
