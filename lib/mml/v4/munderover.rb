# frozen_string_literal: true

module Mml
  module V4
    class Munderover < Mml::V3::Munderover
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :accent, :string
      attribute :accentunder, :string
      attribute :align, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "munderover"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "accent", to: :accent
        map_attribute "accentunder", to: :accentunder
        map_attribute "align", to: :align
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
