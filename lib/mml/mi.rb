# frozen_string_literal: true

require "mml"
require_relative "malignmark"
require_relative "mglyph"

module Mml
  class Mi < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mi)

    attribute :text, :string
    attribute :mathcolor, :string # implemented in Plurimath
    attribute :mathbackground, :string # implemented in Plurimath
    attribute :mathvariant, :string
    attribute :mathsize, :string
    attribute :dir, :string
    attribute :fontfamily, :string
    attribute :fontweight, :string
    attribute :fontstyle, :string
    attribute :fontsize, :string
    attribute :color, :string # implemented in Plurimath
    attribute :background, :string # implemented in Plurimath
    attribute :mglyph, Mglyph, collection: true
    attribute :malignmark, Malignmark, collection: true

    xml do
      root "mi"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_content to: :text
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
      map_element "mglyph", to: :mglyph
      map_element "malignmark", to: :malignmark
    end
  end
end
