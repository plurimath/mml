# frozen_string_literal: true

module Mml
  module Base
    module Ms
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :fontfamily, :string
          attribute :background, :string
          attribute :fontweight, :string
          attribute :mathcolor, :string
          attribute :fontstyle, :string
          attribute :mathsize, :string
          attribute :fontsize, :string
          attribute :lquote, :string
          attribute :rquote, :string
          attribute :color, :string
          attribute :value, :string
          attribute :dir, :string

          xml do
            namespace Mml::Namespace
            element "ms"
            mixed_content

            map_content to: :value
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "fontfamily", to: :fontfamily
            map_attribute "fontweight", to: :fontweight
            map_attribute "background", to: :background
            map_attribute "fontstyle", to: :fontstyle
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "fontsize", to: :fontsize
            map_attribute "mathsize", to: :mathsize
            map_attribute "lquote", to: :lquote
            map_attribute "rquote", to: :rquote
            map_attribute "color", to: :color
            map_attribute "dir", to: :dir
          end
        end
      end
    end
  end
end
