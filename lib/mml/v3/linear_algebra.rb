# frozen_string_literal: true

module Mml
  module V3
    class Vector < CommonElements
      include Base::Content::Vector
    end

    class Matrix < CommonElements
      include Base::Content::Matrix
    end

    class Matrixrow < CommonElements
      include Base::Content::Matrixrow
    end

    class Determinant < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Determinant
    end

    class Transpose < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Transpose
    end

    class Selector < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Selector
    end

    class Vectorproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Vectorproduct
    end

    class Scalarproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Scalarproduct
    end

    class Outerproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Outerproduct
    end
  end
end
