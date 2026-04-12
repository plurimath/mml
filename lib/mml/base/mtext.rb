# frozen_string_literal: true

module Mml
  module Base
    module Mtext
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :value, :string
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :mathvariant, :string

          xml do
            namespace Mml::Namespace
            element "mtext"

            map_content to: :value
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathvariant", to: :mathvariant
          end
        end
      end
    end
  end
end
