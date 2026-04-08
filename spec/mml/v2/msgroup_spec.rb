# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Msgroup do
  describe "parsing" do
    it "parses msgroup in mstack context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msgroup><msrow><mn>1</mn></msrow></msgroup></mstack></math>"
      math = Mml::V2.parse(input)
      expect(math.mstack_value).not_to be_empty
    end
  end
end
