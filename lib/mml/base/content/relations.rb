# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Relation operator base module
      module Relation
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

      module Eq
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "eq" }
          end
        end
      end

      module Neq
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "neq" }
          end
        end
      end

      module Leq
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "leq" }
          end
        end
      end

      module Lt
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "lt" }
          end
        end
      end

      module Geq
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "geq" }
          end
        end
      end

      module Gt
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "gt" }
          end
        end
      end

      module Equivalent
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "equivalent" }
          end
        end
      end

      module Approx
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "approx" }
          end
        end
      end

      module Factorof
        def self.included(klass)
          klass.class_eval do
            include Relation

            xml { element "factorof" }
          end
        end
      end
    end
  end
end
