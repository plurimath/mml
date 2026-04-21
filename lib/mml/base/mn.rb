# frozen_string_literal: true

module Mml
  module Base
    module Mn
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :value, :string, collection: true
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :mathsize, :string
          attribute :mglyph_value, :mglyph, collection: true

          xml do
            namespace Mml::Namespace
            element "mn"
            mixed_content

            map_content to: :value
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathsize", to: :mathsize
            map_element "mglyph", to: :mglyph_value
          end
        end
      end
    end
  end
end
