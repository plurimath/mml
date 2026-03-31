# frozen_string_literal: true

module Mml
  module V3
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
        namespace Namespace
        element "mi"

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
      end
    end
    Configuration.register.register_model(Mi, id: :mi)
  end
end
