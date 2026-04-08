# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mi do
  describe "round-trip" do
    it "parses and serializes simple identifier" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>x</mi></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses multi-character identifier" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>sin</mi></math>"
      output = Mml::V2.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves value content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mi>D</mi></math>"
      math = Mml::V2.parse(input)
      expect(math.mi_value.first.value).to eq("D")
    end

    it "preserves mathvariant attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mi mathvariant="script">L</mi></math>'
      math = Mml::V2.parse(input)
      expect(math.mi_value.first.mathvariant).to eq("script")
    end

    it "preserves mathsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mi mathsize="big">x</mi></math>'
      math = Mml::V2.parse(input)
      expect(math.mi_value.first.mathsize).to eq("big")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mi mathcolor="red">x</mi></math>'
      math = Mml::V2.parse(input)
      expect(math.mi_value.first.mathcolor).to eq("red")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mi mathbackground="yellow">x</mi></math>'
      math = Mml::V2.parse(input)
      expect(math.mi_value.first.mathbackground).to eq("yellow")
    end
  end
end
