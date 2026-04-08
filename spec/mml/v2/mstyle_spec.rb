# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mstyle do
  describe "parsing" do
    it "parses mstyle with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathcolor="red"><mi>x</mi></mstyle></math>'
      math = Mml::V2.parse(input)
      expect(math.mstyle_value).not_to be_empty
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle mathcolor="blue"><mi>x</mi></mstyle></math>'
      math = Mml::V2.parse(input)
      expect(math.mstyle_value.first.mathcolor).to eq("blue")
    end

    it "preserves scriptminsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle scriptminsize="8pt"><mi>x</mi></mstyle></math>'
      math = Mml::V2.parse(input)
      expect(math.mstyle_value.first.scriptminsize).to eq("8pt")
    end

    it "preserves scriptsizemultiplier attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstyle scriptsizemultiplier="0.71"><mi>x</mi></mstyle></math>'
      math = Mml::V2.parse(input)
      expect(math.mstyle_value.first.scriptsizemultiplier).to eq(0)
    end
  end
end
