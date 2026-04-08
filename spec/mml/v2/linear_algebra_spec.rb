# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml::V2 Linear algebra operators" do # rubocop:disable RSpec/DescribeClass
  describe "linear algebra operators in apply" do
    it "parses vector constructor" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<vector><cn>1</cn><cn>2</cn><cn>3</cn></vector></math>"
      math = Mml::V2.parse(input)
      expect(math.vector_value).not_to be_empty
    end

    it "parses matrix constructor" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<matrix><matrixrow><cn>1</cn><cn>0</cn></matrixrow>" \
              "<matrixrow><cn>0</cn><cn>1</cn></matrixrow></matrix></math>"
      math = Mml::V2.parse(input)
      expect(math.matrix_value).not_to be_empty
    end

    it "parses determinant in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><determinant/><ci>A</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses transpose in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><transpose/><ci>A</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses selector in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><selector/><ci>A</ci><cn>1</cn><cn>2</cn></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses vectorproduct in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><vectorproduct/><ci>u</ci><ci>v</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses scalarproduct in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><scalarproduct/><ci>u</ci><ci>v</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end

    it "parses outerproduct in apply" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
              "<apply><outerproduct/><ci>u</ci><ci>v</ci></apply></math>"
      math = Mml::V2.parse(input)
      expect(math.apply_value).not_to be_empty
    end
  end
end
