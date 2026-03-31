# frozen_string_literal: true

module Mml
  module V4
    class Mpadded < Mml::V3::Mpadded
      attribute :mathbackground, :string
      attribute :mathcolor, :string
      attribute :voffset, :string
      attribute :height, :string
      attribute :lspace, :string
      attribute :depth, :string
      attribute :width, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "mpadded"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "voffset", to: :voffset
        map_attribute "height", to: :height
        map_attribute "lspace", to: :lspace
        map_attribute "depth", to: :depth
        map_attribute "width", to: :width
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
