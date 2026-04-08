# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Constants" do # rubocop:disable RSpec/DescribeClass
  describe "constant elements" do
    it "parses pi constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><pi/></math>'
      math = Mml::V2.parse(input)
      expect(math.pi_value).not_to be_empty
    end

    it "parses exponentiale constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><exponentiale/></math>'
      math = Mml::V2.parse(input)
      expect(math.exponentiale_value).not_to be_empty
    end

    it "parses imaginaryi constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><imaginaryi/></math>'
      math = Mml::V2.parse(input)
      expect(math.imaginaryi_value).not_to be_empty
    end

    it "parses eulergamma constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><eulergamma/></math>'
      math = Mml::V2.parse(input)
      expect(math.eulergamma_value).not_to be_empty
    end

    it "parses infinity constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><infinity/></math>'
      math = Mml::V2.parse(input)
      expect(math.infinity_value).not_to be_empty
    end

    it "parses notanumber constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><notanumber/></math>'
      math = Mml::V2.parse(input)
      expect(math.notanumber_value).not_to be_empty
    end

    it "parses true constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><true/></math>'
      math = Mml::V2.parse(input)
      expect(math.true_value).not_to be_empty
    end

    it "parses false constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><false/></math>'
      math = Mml::V2.parse(input)
      expect(math.false_value).not_to be_empty
    end

    it "parses emptyset constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><emptyset/></math>'
      math = Mml::V2.parse(input)
      expect(math.emptyset_value).not_to be_empty
    end

    it "parses integers set constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><integers/></math>'
      math = Mml::V2.parse(input)
      expect(math.integers_value).not_to be_empty
    end

    it "parses reals set constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><reals/></math>'
      math = Mml::V2.parse(input)
      expect(math.reals_value).not_to be_empty
    end

    it "parses rationals set constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><rationals/></math>'
      math = Mml::V2.parse(input)
      expect(math.rationals_value).not_to be_empty
    end

    it "parses complexes set constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><complexes/></math>'
      math = Mml::V2.parse(input)
      expect(math.complexes_value).not_to be_empty
    end

    it "parses naturalnumbers set constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><naturalnumbers/></math>'
      math = Mml::V2.parse(input)
      expect(math.naturalnumbers_value).not_to be_empty
    end

    it "parses primes set constant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><primes/></math>'
      math = Mml::V2.parse(input)
      expect(math.primes_value).not_to be_empty
    end
  end
end
