# frozen_string_literal: true

module Mml
  class Mglyph < Lutaml::Model::Serializable
    attribute :alt, :string
    attribute :src, :string
    attribute :width, :string
    attribute :color, :string
    attribute :index, :integer
    attribute :height, :string
    attribute :valign, :string
    attribute :mathsize, :string
    attribute :fontsize, :string
    attribute :fontstyle, :string
    attribute :mathcolor, :string
    attribute :fontfamily, :string
    attribute :fontweight, :string
    attribute :background, :string
    attribute :mathvariant, :string
    attribute :mathbackground, :string

    xml do
      namespace Namespace
      element "mglyph"

      map_attribute "src", to: :src
      map_attribute "alt", to: :alt
      map_attribute "color", to: :color
      map_attribute "index", to: :index
      map_attribute "width", to: :width
      map_attribute "height", to: :height
      map_attribute "valign", to: :valign
      map_attribute "mathsize", to: :mathsize
      map_attribute "fontsize", to: :fontsize
      map_attribute "fontstyle", to: :fontstyle
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "background", to: :background
      map_attribute "fontfamily", to: :fontfamily
      map_attribute "fontweight", to: :fontweight
      map_attribute "mathvariant", to: :mathvariant
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
