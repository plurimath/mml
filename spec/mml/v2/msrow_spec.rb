# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Msrow do
  describe "parsing" do
    it "parses msrow with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msrow><mn>1</mn><mn>2</mn></msrow></mstack></math>"
      math = Mml::V2.parse(input)
      expect(math.mstack_value).not_to be_empty
    end
  end
end
