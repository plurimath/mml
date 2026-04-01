# frozen_string_literal: true

module Mml
  module Base
    module Mi
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :dir, :string
          attribute :value, :string
          attribute :color, :string
          attribute :mathsize, :string
          attribute :mathcolor, :string
          attribute :mathvariant, :string
          attribute :mathbackground, :string

          attribute :fontsize, :string
          attribute :fontstyle, :string
          attribute :background, :string
          attribute :fontfamily, :string
          attribute :fontweight, :string

          xml do
            namespace Mml::Namespace
            element "mi"

            map_content to: :value
            map_attribute "dir", to: :dir
            map_attribute "color", to: :color
            map_attribute "mathsize", to: :mathsize
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathbackground", to: :mathbackground

            map_attribute "fontsize", to: :fontsize
            map_attribute "fontstyle", to: :fontstyle
            map_attribute "background", to: :background
            map_attribute "fontfamily", to: :fontfamily
            map_attribute "fontweight", to: :fontweight
          end
        end
      end
    end
  end
end
