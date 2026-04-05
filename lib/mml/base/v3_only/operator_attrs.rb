# frozen_string_literal: true

module Mml
  module Base
    module V3Only
      # Operator attributes removed in MathML 4: fence, separator.
      # These are valid in mathml4-legacy schema only.
      module OperatorAttributes
        def self.included(klass)
          klass.class_eval do
            attribute :fence, :string
            attribute :separator, :string

            xml do
              namespace Mml::Namespace
              map_attribute "fence", to: :fence
              map_attribute "separator", to: :separator
            end
          end
        end
      end
    end
  end
end
