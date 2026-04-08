# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Statistics operator base module
      module Statistics
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

      module Mean
        def self.included(klass)
          klass.class_eval do
            include Statistics

            xml { element "mean" }
          end
        end
      end

      module Sdev
        def self.included(klass)
          klass.class_eval do
            include Statistics

            xml { element "sdev" }
          end
        end
      end

      module Variance
        def self.included(klass)
          klass.class_eval do
            include Statistics

            xml { element "variance" }
          end
        end
      end

      module Median
        def self.included(klass)
          klass.class_eval do
            include Statistics

            xml { element "median" }
          end
        end
      end

      module Mode
        def self.included(klass)
          klass.class_eval do
            include Statistics

            xml { element "mode" }
          end
        end
      end

      module Moment
        def self.included(klass)
          klass.class_eval do
            include Statistics

            xml { element "moment" }
          end
        end
      end

      module Momentabout
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "momentabout"
              mixed_content
            end
          end
        end
      end
    end
  end
end
