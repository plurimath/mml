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
      namespace "http://www.w3.org/1998/Math/MathML"

      map_content to: :content
      map_element "mi", to: :mi
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "mathvariant", to: :mathvariant, namespace: nil
      map_attribute "mathsize", to: :mathsize, namespace: nil
      map_attribute "dir", to: :dir, namespace: nil
      map_attribute "fontfamily", to: :fontfamily, namespace: nil
      map_attribute "fontweight", to: :fontweight, namespace: nil
      map_attribute "fontstyle", to: :fontstyle, namespace: nil
      map_attribute "fontsize", to: :fontsize, namespace: nil
      map_attribute "color", to: :color, namespace: nil
      map_attribute "background", to: :background, namespace: nil
      map_attribute "lquote", to: :lquote, namespace: nil
      map_attribute "rquote", to: :rquote, namespace: nil
      map_element "mglyph", to: :mglyph
      map_element "malignmark", to: :malignmark
    end
  end
end
