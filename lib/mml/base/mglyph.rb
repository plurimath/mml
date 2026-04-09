# frozen_string_literal: true

module Mml
  module Base
    module Mglyph
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :alt, :string
          attribute :src, :string
          attribute :width, :string
          attribute :index, :integer
          attribute :height, :string
          attribute :valign, :string
          attribute :mathvariant, :string
          attribute :mathbackground, :string
          attribute :fontfamily, :string

          attribute :mathsize, :string
          attribute :mathcolor, :string

          xml do
            namespace Mml::Namespace
            element "mglyph"

            map_attribute "src", to: :src
            map_attribute "alt", to: :alt
            map_attribute "index", to: :index
            map_attribute "width", to: :width
            map_attribute "height", to: :height
            map_attribute "valign", to: :valign
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "fontfamily", to: :fontfamily

            map_attribute "mathsize", to: :mathsize
            map_attribute "mathcolor", to: :mathcolor
          end
        end
      end
    end
  end
end
