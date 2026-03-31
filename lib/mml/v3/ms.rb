# frozen_string_literal: true

module Mml
  module V3
    class Ms < Lutaml::Model::Serializable
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
        namespace Namespace
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
