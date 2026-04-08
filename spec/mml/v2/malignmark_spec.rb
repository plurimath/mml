# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Malignmark do
  describe "parsing" do
    it "parses malignmark" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<malignmark/></math>"
      math = Mml::V2.parse(input)
      expect(math.malignmark_value).not_to be_empty
    end
  end
end
