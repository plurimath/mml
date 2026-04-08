# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Merror do
  describe "parsing" do
    it "parses merror with child" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<merror><mtext>Error</mtext></merror></math>"
      math = Mml::V2.parse(input)
      expect(math.merror_value).not_to be_empty
    end
  end
end
