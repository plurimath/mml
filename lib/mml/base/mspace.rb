# frozen_string_literal: true

module Mml
  module Base
    module Mspace
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :mathsize, :string
          attribute :dir, :string
          attribute :width, :string
          attribute :height, :string
          attribute :depth, :string
          attribute :linebreak, :string
          attribute :indentalign, :string
          attribute :indentshift, :string
          attribute :indenttarget, :string
          attribute :indentalignfirst, :string
          attribute :indentshiftfirst, :string
          attribute :indentalignlast, :string
          attribute :indentshiftlast, :string

          # Deprecated in MathML 4
          attribute :fontfamily, :string
          attribute :fontweight, :string
          attribute :fontstyle, :string
          attribute :fontsize, :string
          attribute :color, :string
          attribute :background, :string

          xml do
            namespace Mml::Namespace
            element "mspace"

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathsize", to: :mathsize
            map_attribute "dir", to: :dir
            map_attribute "width", to: :width
            map_attribute "height", to: :height
            map_attribute "depth", to: :depth
            map_attribute "linebreak", to: :linebreak
            map_attribute "indentalign", to: :indentalign
            map_attribute "indentshift", to: :indentshift
            map_attribute "indenttarget", to: :indenttarget
            map_attribute "indentalignfirst", to: :indentalignfirst
            map_attribute "indentshiftfirst", to: :indentshiftfirst
            map_attribute "indentalignlast", to: :indentalignlast
            map_attribute "indentshiftlast", to: :indentshiftlast

            # Deprecated in MathML 4
            map_attribute "fontfamily", to: :fontfamily
            map_attribute "fontweight", to: :fontweight
            map_attribute "fontstyle", to: :fontstyle
            map_attribute "fontsize", to: :fontsize
            map_attribute "color", to: :color
            map_attribute "background", to: :background
          end
        end
      end
    end
  end
end
