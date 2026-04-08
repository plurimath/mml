# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Functions operator base module
      module Functions
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

      module Compose
        def self.included(klass)
          klass.class_eval do
            include Functions

            xml { element "compose" }
          end
        end
      end

      module Domain
        def self.included(klass)
          klass.class_eval do
            include Functions

            xml { element "domain" }
          end
        end
      end

      module Codomain
        def self.included(klass)
          klass.class_eval do
            include Functions

            xml { element "codomain" }
          end
        end
      end

      module Image
        def self.included(klass)
          klass.class_eval do
            include Functions

            xml { element "image" }
          end
        end
      end

      module Ident
        def self.included(klass)
          klass.class_eval do
            include Functions

            xml { element "ident" }
          end
        end
      end

      module Domainofapplication
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "domainofapplication"
              mixed_content
            end
          end
        end
      end
    end
  end
end
