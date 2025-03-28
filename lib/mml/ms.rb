# frozen_string_literal: true

module Mml
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
      root "ms", mixed: true

      map_content to: :value
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "mathvariant", to: :mathvariant, namespace: nil
      map_attribute "fontfamily", to: :fontfamily, namespace: nil
      map_attribute "fontweight", to: :fontweight, namespace: nil
      map_attribute "background", to: :background, namespace: nil
      map_attribute "fontstyle", to: :fontstyle, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "fontsize", to: :fontsize, namespace: nil
      map_attribute "mathsize", to: :mathsize, namespace: nil
      map_attribute "lquote", to: :lquote, namespace: nil
      map_attribute "rquote", to: :rquote, namespace: nil
      map_attribute "color", to: :color, namespace: nil
      map_attribute "dir", to: :dir, namespace: nil
    end
  end
end
