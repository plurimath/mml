# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Apply do
  describe "round-trip" do
    it "parses and serializes apply element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><plus/><ci>x</ci><cn>1</cn></apply></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses nested apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><plus/><apply><sin/>" \
              "<ci>x</ci></apply><cn>5</cn></apply></math>"
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
