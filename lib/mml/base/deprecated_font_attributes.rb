# frozen_string_literal: true

module Mml
  module Base
    # Deprecated MathML 1 font attributes: fontfamily, fontweight, fontstyle,
    # fontsize, color, background.
    # These are removed in MathML 4 default schema but valid in mathml4-legacy.
    module DeprecatedFontAttributes
      def self.included(klass)
        klass.class_eval do
          attribute :fontfamily, :string
          attribute :fontweight, :string
          attribute :fontstyle, :string
          attribute :fontsize, :string
          attribute :color, :string
          attribute :background, :string

          xml do
            namespace Mml::Namespace
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
