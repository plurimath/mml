# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Cn do
  describe "parsing" do
    it "parses cn with numeric content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<cn>42</cn></math>"
      math = Mml::V2.parse(input)
      expect(math.cn_value).not_to be_empty
      expect(math.cn_value.first.value).to eq("42")
    end

    it "preserves type attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<cn type="complex-cartesian">1<sep/>2</cn></math>'
      math = Mml::V2.parse(input)
      expect(math.cn_value.first.type).to eq("complex-cartesian")
    end

    it "preserves base attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<cn type="integer" base="16">FF</cn></math>'
      math = Mml::V2.parse(input)
      expect(math.cn_value.first.type).to eq("integer")
    end
  end
end
