# frozen_string_literal: true

module Mml
  module V4
    class Vector < Lutaml::Model::Serializable
      include Base::Content::Vector
    end

    class Matrix < Lutaml::Model::Serializable
      include Base::Content::Matrix
    end

    class Matrixrow < Lutaml::Model::Serializable
      include Base::Content::Matrixrow
    end

    class Determinant < Lutaml::Model::Serializable
      include Base::Content::Determinant
    end

    class Transpose < Lutaml::Model::Serializable
      include Base::Content::Transpose
    end

    class Selector < Lutaml::Model::Serializable
      include Base::Content::Selector
    end

    class Vectorproduct < Lutaml::Model::Serializable
      include Base::Content::Vectorproduct
    end

    class Scalarproduct < Lutaml::Model::Serializable
      include Base::Content::Scalarproduct
    end

    class Outerproduct < Lutaml::Model::Serializable
      include Base::Content::Outerproduct
    end
  end
end
