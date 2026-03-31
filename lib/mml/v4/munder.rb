# frozen_string_literal: true

module Mml
  module V4
    class Munder < Mml::V3::Munder
      attribute :mathbackground, :string
      attribute :accentunder, :string
      attribute :mathcolor, :string
      attribute :content, :string
      attribute :align, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "munder"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "accentunder", to: :accentunder
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "align", to: :align
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
        map_content to: :content
      end
    end
  end
end
