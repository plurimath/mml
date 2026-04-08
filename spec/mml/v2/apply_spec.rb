# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Apply do
  describe "parsing" do
    it "parses apply with content children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><plus/><ci>x</ci><cn>1</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<apply definitionURL="http://example.com/op"><plus/></apply></math>'
      math = Mml::V2.parse(input)
      expect(math.apply_value.first.definition_url).to eq("http://example.com/op")
    end
  end
end
