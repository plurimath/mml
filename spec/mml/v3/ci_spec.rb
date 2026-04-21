# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Ci do
  describe "round-trip" do
    it "parses and serializes ci element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ci>x</ci></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses ci with complex identifier" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ci>f</ci></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "extracts value" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<ci>x</ci></math>"
      math = Mml.parse(input)
      expect(math.ci_value.first.value).to eq(["x"])
    end
  end
end
