# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Vector calculus operator base module
      module VectorCalculus
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

      module Divergence
        def self.included(klass)
          klass.class_eval do
            include VectorCalculus

            xml { element "divergence" }
          end
        end
      end

      module Grad
        def self.included(klass)
          klass.class_eval do
            include VectorCalculus

            xml { element "grad" }
          end
        end
      end

      module Curl
        def self.included(klass)
          klass.class_eval do
            include VectorCalculus

            xml { element "curl" }
          end
        end
      end

      module Laplacian
        def self.included(klass)
          klass.class_eval do
            include VectorCalculus

            xml { element "laplacian" }
          end
        end
      end
    end
  end
end
