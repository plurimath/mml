# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Elementary functions operator base module
      module ElementaryFunctions
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

      module Exp
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "exp" }
          end
        end
      end

      module Ln
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "ln" }
          end
        end
      end

      module Log
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "log" }
          end
        end
      end

      module Logbase
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "logbase"
              mixed_content
            end
          end
        end
      end

      # Trigonometric functions
      module Sin
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "sin" }
          end
        end
      end

      module Cos
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "cos" }
          end
        end
      end

      module Tan
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "tan" }
          end
        end
      end

      module Sec
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "sec" }
          end
        end
      end

      module Csc
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "csc" }
          end
        end
      end

      module Cot
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "cot" }
          end
        end
      end

      # Inverse trigonometric functions
      module Arcsin
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arcsin" }
          end
        end
      end

      module Arccos
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arccos" }
          end
        end
      end

      module Arctan
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arctan" }
          end
        end
      end

      module Arccot
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arccot" }
          end
        end
      end

      module Arccsc
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arccsc" }
          end
        end
      end

      module Arcsec
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arcsec" }
          end
        end
      end

      # Hyperbolic functions
      module Sinh
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "sinh" }
          end
        end
      end

      module Cosh
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "cosh" }
          end
        end
      end

      module Tanh
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "tanh" }
          end
        end
      end

      module Sech
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "sech" }
          end
        end
      end

      module Csch
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "csch" }
          end
        end
      end

      module Coth
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "coth" }
          end
        end
      end

      # Inverse hyperbolic functions
      module Arcsinh
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arcsinh" }
          end
        end
      end

      module Arccosh
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arccosh" }
          end
        end
      end

      module Arctanh
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arctanh" }
          end
        end
      end

      module Arccoth
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arccoth" }
          end
        end
      end

      module Arccsch
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arccsch" }
          end
        end
      end

      module Arcsech
        def self.included(klass)
          klass.class_eval do
            include ElementaryFunctions

            xml { element "arcsech" }
          end
        end
      end
    end
  end
end
