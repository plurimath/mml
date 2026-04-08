# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mstack do
  describe "parsing" do
    it "parses mstack with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mstack><msrow><mn>1</mn></msrow></mstack></math>"
      math = Mml::V2.parse(input)
      expect(math.mstack_value).not_to be_empty
    end

    it "preserves stackalign attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mstack stackalign="right"><msrow><mn>1</mn></msrow></mstack></math>'
      math = Mml::V2.parse(input)
      expect(math.mstack_value.first.stackalign).to eq("right")
    end
  end
end
