# frozen_string_literal: true

module Mml
  module V4
    class Mglyph < Mml::V3::Mglyph
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
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "mglyph"

        map_attribute "src", to: :src
        map_attribute "alt", to: :alt
        map_attribute "index", to: :index
        map_attribute "width", to: :width
        map_attribute "height", to: :height
        map_attribute "valign", to: :valign
        map_attribute "mathvariant", to: :mathvariant
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
