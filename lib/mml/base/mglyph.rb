# frozen_string_literal: true

module Mml
  module Base
    module Mglyph
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :alt, :string
          attribute :src, :string
          attribute :width, :string
          # Deprecated in MathML 4
          attribute :index, :integer
          attribute :height, :string
          attribute :valign, :string
          attribute :mathvariant, :string
          attribute :mathbackground, :string

          attribute :color, :string
          attribute :mathsize, :string
          attribute :fontsize, :string
          attribute :fontstyle, :string
          attribute :mathcolor, :string
          attribute :background, :string
          attribute :fontfamily, :string
          attribute :fontweight, :string

          xml do
            namespace Mml::Namespace
            element "mglyph"

            map_attribute "src", to: :src
            map_attribute "alt", to: :alt
            # Deprecated in MathML 4
            map_attribute "index", to: :index
            map_attribute "width", to: :width
            map_attribute "height", to: :height
            map_attribute "valign", to: :valign
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathbackground", to: :mathbackground

            map_attribute "color", to: :color
            map_attribute "mathsize", to: :mathsize
            map_attribute "fontsize", to: :fontsize
            map_attribute "fontstyle", to: :fontstyle
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "background", to: :background
            map_attribute "fontfamily", to: :fontfamily
            map_attribute "fontweight", to: :fontweight
          end
        end
      end
    end
  end
end
