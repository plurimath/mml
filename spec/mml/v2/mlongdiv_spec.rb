# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V2::Mlongdiv do
  describe "parsing" do
    it "parses mlongdiv with children" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mlongdiv longdivstyle="lefttop"><mn>3</mn><mn>456</mn>' \
              "<mstack><msrow><mn>152</mn></msrow></mstack></mlongdiv></math>"
      math = Mml::V2.parse(input)
      expect(math.mlongdiv_value).not_to be_empty
    end

    it "preserves longdivstyle attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              '<mlongdiv longdivstyle="lefttop"><mn>3</mn><mn>456</mn>' \
              "<mstack><msrow><mn>152</mn></msrow></mstack></mlongdiv></math>"
      math = Mml::V2.parse(input)
      expect(math.mlongdiv_value.first.longdivstyle).to eq("lefttop")
    end
  end
end
