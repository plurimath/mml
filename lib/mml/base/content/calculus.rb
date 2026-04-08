# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Calculus operator base module
      module Calculus
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

      module Int
        def self.included(klass)
          klass.class_eval do
            include Calculus

            xml { element "int" }
          end
        end
      end

      module Diff
        def self.included(klass)
          klass.class_eval do
            include Calculus

            xml { element "diff" }
          end
        end
      end

      module Partialdiff
        def self.included(klass)
          klass.class_eval do
            include Calculus

            xml { element "partialdiff" }
          end
        end
      end

      module Limit
        def self.included(klass)
          klass.class_eval do
            include Calculus

            xml do
              namespace Mml::Namespace
              element "limit"
            end
          end
        end
      end

      module Lowlimit
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "lowlimit"
              mixed_content
            end
          end
        end
      end

      module Uplimit
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "uplimit"
              mixed_content
            end
          end
        end
      end

      module Tendsto
        def self.included(klass)
          klass.class_eval do
            attribute :type, :string
            xml do
              namespace Mml::Namespace
              element "tendsto"
              map_attribute "type", to: :type
            end
          end
        end
      end
    end
  end
end
