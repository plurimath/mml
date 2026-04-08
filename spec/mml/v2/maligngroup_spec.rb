# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Maligngroup do
  describe "parsing" do
    it "parses maligngroup" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<maligngroup/></math>"
      math = Mml::V2.parse(input)
      expect(math.maligngroup_value).not_to be_empty
    end
  end
end
