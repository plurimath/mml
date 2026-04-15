# frozen_string_literal: true

module Mml
  module V3
    class Vector < CommonElements
      include Base::Content::Vector
    end
    Configuration.register_model(Vector, id: :vector)

    class Matrix < CommonElements
      include Base::Content::Matrix
    end
    Configuration.register_model(Matrix, id: :matrix)

    class Matrixrow < CommonElements
      include Base::Content::Matrixrow
    end
    Configuration.register_model(Matrixrow, id: :matrixrow)

    class Determinant < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Determinant
    end
    Configuration.register_model(Determinant, id: :determinant)

    class Transpose < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Transpose
    end
    Configuration.register_model(Transpose, id: :transpose)

    class Selector < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Selector
    end
    Configuration.register_model(Selector, id: :selector)

    class Vectorproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Vectorproduct
    end
    Configuration.register_model(Vectorproduct, id: :vectorproduct)

    class Scalarproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Scalarproduct
    end
    Configuration.register_model(Scalarproduct, id: :scalarproduct)

    class Outerproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Outerproduct
    end
    Configuration.register_model(Outerproduct, id: :outerproduct)
  end
end
