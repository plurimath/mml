# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Logic operator base module
      module Logic
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

      module And
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "and" }
          end
        end
      end

      module Or
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "or" }
          end
        end
      end

      module Xor
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "xor" }
          end
        end
      end

      module Not
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "not" }
          end
        end
      end

      module Exists
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "exists" }
          end
        end
      end

      module Forall
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "forall" }
          end
        end
      end

      module Implies
        def self.included(klass)
          klass.class_eval do
            include Logic

            xml { element "implies" }
          end
        end
      end
    end
  end
end
