# frozen_string_literal: true

module Mml
  module V4
    class Mfenced < Mml::V3::Mfenced
      attribute :mathbackground, :string
      attribute :separators, :string
      attribute :mathcolor, :string
      attribute :content, :string
      attribute :close, :string
      attribute :open, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "mfenced"
        mixed_content

        map_content to: :content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "separators", to: :separators
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "close", to: :close
        map_attribute "open", to: :open
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
