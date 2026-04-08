# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Linear algebra operator base module
      module LinearAlgebra
        def self.included(klass)
          klass.class_eval do
            attribute :definition_url, :string
            attribute :encoding_value, :string

            xml do
              namespace Mml::Namespace
              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :encoding_value
            end
          end
        end
      end

      module Vector
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml do
              element "vector"
              mixed_content
            end
          end
        end
      end

      module Matrix
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml do
              element "matrix"
              mixed_content
            end
          end
        end
      end

      module Matrixrow
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml do
              element "matrixrow"
              mixed_content
            end
          end
        end
      end

      module Determinant
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml { element "determinant" }
          end
        end
      end

      module Transpose
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml { element "transpose" }
          end
        end
      end

      module Selector
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml { element "selector" }
          end
        end
      end

      module Vectorproduct
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml { element "vectorproduct" }
          end
        end
      end

      module Scalarproduct
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml { element "scalarproduct" }
          end
        end
      end

      module Outerproduct
        def self.included(klass)
          klass.class_eval do
            include LinearAlgebra

            xml { element "outerproduct" }
          end
        end
      end
    end
  end
end
