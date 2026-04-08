# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Sets operator base module
      module Sets
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

      module Set
        def self.included(klass)
          klass.class_eval do
            include Sets

            attribute :type, :string
            xml do
              element "set"
              mixed_content
              map_attribute "type", to: :type
            end
          end
        end
      end

      module List
        def self.included(klass)
          klass.class_eval do
            include Sets

            attribute :order, :string
            xml do
              element "list"
              mixed_content
              map_attribute "order", to: :order
            end
          end
        end
      end

      module Union
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "union" }
          end
        end
      end

      module Intersect
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "intersect" }
          end
        end
      end

      module In
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "in" }
          end
        end
      end

      module Notin
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "notin" }
          end
        end
      end

      module Subset
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "subset" }
          end
        end
      end

      module Prsubset
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "prsubset" }
          end
        end
      end

      module Notsubset
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "notsubset" }
          end
        end
      end

      module Notprsubset
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "notprsubset" }
          end
        end
      end

      module Setdiff
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "setdiff" }
          end
        end
      end

      module Card
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "card" }
          end
        end
      end

      module Cartesianproduct
        def self.included(klass)
          klass.class_eval do
            include Sets

            xml { element "cartesianproduct" }
          end
        end
      end
    end
  end
end
