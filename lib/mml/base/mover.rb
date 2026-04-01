# frozen_string_literal: true

module Mml
  module Base
    module Mover
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :mathcolor, :string
          attribute :accent, :string
          attribute :align, :string

          xml do
            namespace Mml::Namespace
            element "mover"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "accent", to: :accent
            map_attribute "align", to: :align
          end
        end
      end
    end
  end
end
