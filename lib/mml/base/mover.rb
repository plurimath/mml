# frozen_string_literal: true

module Mml
  module Base
    module Mover
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
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
