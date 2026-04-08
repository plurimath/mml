# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mlabeledtr do
  describe "parsing" do
    it "parses mlabeledtr in mtable context" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mtable><mlabeledtr><mtd><mi>a</mi></mtd>" \
              "<mtd><mi>b</mi></mtd></mlabeledtr></mtable></math>"
      math = Mml::V2.parse(input)
      expect(math.mtable_value).not_to be_empty
    end
  end
end
