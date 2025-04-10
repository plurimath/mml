# frozen_string_literal: true

module Mml
  class Mi < Lutaml::Model::Serializable
    attribute :dir, :string
    attribute :value, :string
    attribute :color, :string
    attribute :mathsize, :string
    attribute :fontsize, :string
    attribute :fontstyle, :string
    attribute :mathcolor, :string
    attribute :background, :string
    attribute :fontfamily, :string
    attribute :fontweight, :string
    attribute :mathvariant, :string
    attribute :mathbackground, :string

    xml do
      root "mi"

      map_content to: :value
      map_attribute "dir", to: :dir, namespace: nil
      map_attribute "color", to: :color, namespace: nil
      map_attribute "mathsize", to: :mathsize, namespace: nil
      map_attribute "fontsize", to: :fontsize, namespace: nil
      map_attribute "fontstyle", to: :fontstyle, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "fontfamily", to: :fontfamily, namespace: nil
      map_attribute "fontweight", to: :fontweight, namespace: nil
      map_attribute "background", to: :background, namespace: nil
      map_attribute "mathvariant", to: :mathvariant, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
end
