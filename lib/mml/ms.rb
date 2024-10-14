# frozen_string_literal: true

require_relative "malignmark"
require_relative "mglyph"

module Mml
  class Ms < Lutaml::Model::Serializable
    attribute :content, :string
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :mathvariant, :string
    attribute :mathsize, :string
    attribute :dir, :string
    attribute :fontfamily, :string
    attribute :fontweight, :string
    attribute :fontstyle, :string
    attribute :fontsize, :string
    attribute :color, :string
    attribute :background, :string
    attribute :lquote, :string
    attribute :rquote, :string
    attribute :mglyph, Mglyph, collection: true
    attribute :malignmark, Malignmark, collection: true
    attribute :mi, Mi

    xml do
      root "ms", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_content to: :content
      map_element "mi", to: :mi
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "mathvariant", to: :mathvariant
      map_attribute "mathsize", to: :mathsize
      map_attribute "dir", to: :dir
      map_attribute "fontfamily", to: :fontfamily
      map_attribute "fontweight", to: :fontweight
      map_attribute "fontstyle", to: :fontstyle
      map_attribute "fontsize", to: :fontsize
      map_attribute "color", to: :color
      map_attribute "background", to: :background
      map_attribute "lquote", to: :lquote
      map_attribute "rquote", to: :rquote
      map_element "mglyph", to: :mglyph
      map_element "malignmark", to: :malignmark
    end
  end
end
