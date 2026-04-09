# frozen_string_literal: true

module Mml
  module V2
    class Vector < CommonElements
      include Base::Content::Vector
    end

    class Matrix < CommonElements
      include Base::Content::Matrix
    end

    class Matrixrow < CommonElements
      include Base::Content::Matrixrow
    end

    class Determinant < CommonElements
      include Base::Content::Determinant
    end

    class Transpose < CommonElements
      include Base::Content::Transpose
    end

    class Selector < CommonElements
      include Base::Content::Selector
    end

    class Vectorproduct < CommonElements
      include Base::Content::Vectorproduct
    end

    class Scalarproduct < CommonElements
      include Base::Content::Scalarproduct
    end

    class Outerproduct < CommonElements
      include Base::Content::Outerproduct
    end
  end
end
