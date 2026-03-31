# frozen_string_literal: true

module Mml
  module V4
    class Mspace < Mml::V3::Mspace
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
      attribute :width, :string
      attribute :height, :string
      attribute :depth, :string
      attribute :linebreak, :string
      attribute :indentalign, :string
      attribute :indentshift, :string
      attribute :indenttarget, :string
      attribute :indentalignfirst, :string
      attribute :indentshiftfirst, :string
      attribute :indentalignlast, :string
      attribute :indentshiftlast, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "mspace"

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "mathvariant", to: :mathvariant
        map_attribute "mathsize", to: :mathsize
        map_attribute "dir", to: :dir
        map_attribute "width", to: :width
        map_attribute "height", to: :height
        map_attribute "depth", to: :depth
        map_attribute "linebreak", to: :linebreak
        map_attribute "indentalign", to: :indentalign
        map_attribute "indentshift", to: :indentshift
        map_attribute "indenttarget", to: :indenttarget
        map_attribute "indentalignfirst", to: :indentalignfirst
        map_attribute "indentshiftfirst", to: :indentshiftfirst
        map_attribute "indentalignlast", to: :indentalignlast
        map_attribute "indentshiftlast", to: :indentshiftlast
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
