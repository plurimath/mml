# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Arithmetic operator base module
      module Arith
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

      module Abs
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "abs" }
          end
        end
      end

      module Conjugate
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "conjugate" }
          end
        end
      end

      module Arg
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "arg" }
          end
        end
      end

      module Real
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "real" }
          end
        end
      end

      module Imaginary
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "imaginary" }
          end
        end
      end

      module Floor
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "floor" }
          end
        end
      end

      module Ceiling
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "ceiling" }
          end
        end
      end

      module Quotient
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "quotient" }
          end
        end
      end

      module Divide
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "divide" }
          end
        end
      end

      module Rem
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "rem" }
          end
        end
      end

      module Minus
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "minus" }
          end
        end
      end

      module Plus
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "plus" }
          end
        end
      end

      module Times
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "times" }
          end
        end
      end

      module Power
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "power" }
          end
        end
      end

      module Root
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "root" }
          end
        end
      end

      module Max
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "max" }
          end
        end
      end

      module Min
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "min" }
          end
        end
      end

      module Gcd
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "gcd" }
          end
        end
      end

      module Lcm
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "lcm" }
          end
        end
      end

      module Sum
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "sum" }
          end
        end
      end

      module Product
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "product" }
          end
        end
      end

      module Factorial
        def self.included(klass)
          klass.class_eval do
            include Arith

            xml { element "factorial" }
          end
        end
      end
    end
  end
end
