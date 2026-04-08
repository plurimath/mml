# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Csymbol do
  describe "parsing" do
    it "parses csymbol with text content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<csymbol>mySymbol</csymbol></math>"
      math = Mml::V2.parse(input)
      expect(math.csymbol_value).not_to be_empty
      expect(math.csymbol_value.first.value).to eq("mySymbol")
    end

    it "preserves definitionURL attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<csymbol definitionURL="http://example.com/sym">F</csymbol></math>'
      math = Mml::V2.parse(input)
      expect(math.csymbol_value.first.definition_url).to eq("http://example.com/sym")
    end
  end
end
