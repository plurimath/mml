# frozen_string_literal: true

module Mml
  module V4
    class Mi < Mml::V3::Mi
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
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "mi"

        map_content to: :value
        map_attribute "dir", to: :dir
        map_attribute "color", to: :color
        map_attribute "mathsize", to: :mathsize
        map_attribute "mathcolor", to: :mathcolor
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
