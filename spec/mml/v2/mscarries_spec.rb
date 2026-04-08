# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mscarries do
  describe "parsing" do
    it "parses mscarries in mstack context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><mscarries><mscarry><mn>1</mn></mscarry></mscarries></mstack></math>"
      math = Mml::V2.parse(input)
      expect(math.mstack_value).not_to be_empty
    end

    it "parses mscarries with location attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack><mscarries location="nw"><mscarry><mn>1</mn></mscarry></mscarries></mstack></math>'
      math = Mml::V2.parse(input)
      expect(math.mstack_value).not_to be_empty
    end
  end
end
