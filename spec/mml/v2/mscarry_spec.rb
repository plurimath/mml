# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mscarry do
  describe "parsing" do
    it "parses mscarry in mscarries context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><mscarries><mscarry><mn>1</mn></mscarry></mscarries></mstack></math>"
      math = Mml::V2.parse(input)
      expect(math.mstack_value).not_to be_empty
    end
  end
end
