# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mfraction do
  describe "parsing" do
    it "parses mfraction with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<mfraction><mn>1</mn><mn>2</mn></mfraction></math>"
      math = Mml::V2.parse(input)
      expect(math.mfraction_value).not_to be_empty
    end

    it "preserves linethickness attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mfraction linethickness="3px"><mn>1</mn><mn>2</mn></mfraction></math>'
      math = Mml::V2.parse(input)
      expect(math.mfraction_value.first.linethickness).to eq("3px")
    end
  end
end
