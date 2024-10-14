# frozen_string_literal: true

# require_relative "malignmark"
# require_relative "mglyph"

module Mml
  class Mi < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mi)

    attribute :dir, :string # implemented in Plurimath
    attribute :value, :string # implemented in Plurimath
    attribute :color, :string # implemented in Plurimath
    attribute :mathsize, :string # implemented in Plurimath
    attribute :fontsize, :string # implemented in Plurimath
    attribute :fontstyle, :string # implemented in Plurimath
    attribute :mathcolor, :string # implemented in Plurimath
    attribute :background, :string # implemented in Plurimath
    attribute :fontfamily, :string # implemented in Plurimath
    attribute :fontweight, :string # implemented in Plurimath
    attribute :mathvariant, :string # implemented in Plurimath
    attribute :mathbackground, :string # implemented in Plurimath
    # attribute :mglyph, Mglyph, collection: true # implemented in Plurimath
    # attribute :malignmark, Malignmark, collection: true # implemented in Plurimath

    xml do
      root "mi"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_content to: :value
      map_attribute "dir", to: :dir
      map_attribute "color", to: :color
      map_attribute "mathsize", to: :mathsize
      map_attribute "fontsize", to: :fontsize
      map_attribute "fontstyle", to: :fontstyle
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "fontfamily", to: :fontfamily
      map_attribute "fontweight", to: :fontweight
      map_attribute "background", to: :background
      map_attribute "mathvariant", to: :mathvariant
      map_attribute "mathbackground", to: :mathbackground
      # map_element "mglyph", to: :mglyph
      # map_element "malignmark", to: :malignmark
    end
  end
end
