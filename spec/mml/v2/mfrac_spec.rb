# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mfrac do
  describe "parsing" do
    it "parses mfrac with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfrac><mn>1</mn><mn>2</mn></mfrac></math>"
      math = Mml::V2.parse(input)
      expect(math.mfrac_value).not_to be_empty
    end

    it "preserves linethickness attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac linethickness="2px"><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml::V2.parse(input)
      expect(math.mfrac_value.first.linethickness).to eq("2px")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac mathcolor="blue"><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml::V2.parse(input)
      expect(math.mfrac_value.first.mathcolor).to eq("blue")
    end

    it "preserves numalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac numalign="left"><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml::V2.parse(input)
      expect(math.mfrac_value.first.numalign).to eq("left")
    end

    it "preserves denomalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac denomalign="right"><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml::V2.parse(input)
      expect(math.mfrac_value.first.denomalign).to eq("right")
    end

    it "preserves bevelled attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfrac bevelled="true"><mn>1</mn><mn>2</mn></mfrac></math>'
      math = Mml::V2.parse(input)
      expect(math.mfrac_value.first.bevelled).to eq("true")
    end
  end
end
