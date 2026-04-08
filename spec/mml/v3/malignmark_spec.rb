# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Malignmark do
  describe "round-trip" do
    it "parses and serializes align mark element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<malignmark/></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
