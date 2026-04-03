# frozen_string_literal: true

module Mml
  module Base
    module Math
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :display, :string

          xml do
            namespace Mml::Namespace
            element "math"
            mixed_content

            map_attribute :display, to: :display
          end
        end
      end
    end
  end
end
