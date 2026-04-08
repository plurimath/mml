# frozen_string_literal: true

module Mml
  module Base
    module Maction
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :actiontype, :string
          attribute :selection, :string

          xml do
            namespace Mml::Namespace
            element "maction"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "actiontype", to: :actiontype
            map_attribute "selection", to: :selection
          end
        end
      end
    end
  end
end
