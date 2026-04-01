# frozen_string_literal: true

module Mml
  module Base
    module Math
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
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
