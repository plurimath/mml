# frozen_string_literal: true

module Mml
  module Base
    module Malignmark
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :edge, :string

          xml do
            namespace Mml::Namespace
            element "malignmark"

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "edge", to: :edge
          end
        end
      end
    end
  end
end
