# frozen_string_literal: true

module Mml
  module Base
    module Mn
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :value, :string
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :mathsize, :string
          attribute :dir, :string
          # Deprecated in MathML 4
          attribute :fontfamily, :string
          attribute :fontweight, :string
          attribute :fontstyle, :string
          attribute :fontsize, :string
          attribute :color, :string
          attribute :background, :string

          xml do
            namespace Mml::Namespace
            element "mn"

            map_content to: :value
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathsize", to: :mathsize
            map_attribute "dir", to: :dir
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
