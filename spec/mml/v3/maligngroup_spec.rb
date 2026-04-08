# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V3::Maligngroup do
  describe "round-trip" do
    it "parses and serializes align group element" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<maligngroup/></math>"
      output = Mml.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves groupalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<maligngroup groupalign="left"/></math>'
      math = Mml.parse(input)
      expect(math.maligngroup_value.first.groupalign).to eq("left")
    end
  end
end
