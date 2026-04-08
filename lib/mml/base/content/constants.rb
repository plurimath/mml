# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Constant base module
      module Constant
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

      module Naturalnumbers
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "naturalnumbers" }
          end
        end
      end

      module Primes
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "primes" }
          end
        end
      end

      module Integers
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "integers" }
          end
        end
      end

      module Rationals
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "rationals" }
          end
        end
      end

      module Reals
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "reals" }
          end
        end
      end

      module Complexes
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "complexes" }
          end
        end
      end

      module Emptyset
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "emptyset" }
          end
        end
      end

      module Exponentiale
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "exponentiale" }
          end
        end
      end

      module Imaginaryi
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "imaginaryi" }
          end
        end
      end

      module Pi
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "pi" }
          end
        end
      end

      module Eulergamma
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "eulergamma" }
          end
        end
      end

      module True
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "true" }
          end
        end
      end

      module False
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "false" }
          end
        end
      end

      module Infinity
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "infinity" }
          end
        end
      end

      module Notanumber
        def self.included(klass)
          klass.class_eval do
            include Constant

            xml { element "notanumber" }
          end
        end
      end
    end
  end
end
