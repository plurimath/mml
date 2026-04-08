# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Reln do
  describe "parsing" do
    it "parses reln with relation children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<reln><eq/><ci>x</ci><cn>1</cn></reln></math>"
      math = Mml::V2.parse(input)
      expect(math.reln_value).not_to be_empty
    end
  end
end
