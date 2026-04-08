# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Bind do
  describe "parsing" do
    it "parses bind with bvar and apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<bind><lambda/><bvar><ci>x</ci></bvar>" \
              "<apply><plus/><ci>x</ci><cn>1</cn></apply></bind></math>"
      math = Mml::V2.parse(input)
      expect(math.bind_value).not_to be_empty
    end

    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<bind definitionURL="http://example.com/bind"><lambda/>' \
              "<bvar><ci>x</ci></bvar></bind></math>"
      math = Mml::V2.parse(input)
      expect(math.bind_value.first.definition_url).to eq("http://example.com/bind")
    end
  end
end
