# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Interval do
  describe "parsing" do
    it "parses interval with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<interval><cn>0</cn><cn>1</cn></interval></math>"
      math = Mml::V2.parse(input)
      expect(math.interval_value).not_to be_empty
    end

    it "preserves closure attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<interval closure="open"><cn>0</cn><cn>1</cn></interval></math>'
      math = Mml::V2.parse(input)
      expect(math.interval_value.first.closure).to eq("open")
    end
  end
end
