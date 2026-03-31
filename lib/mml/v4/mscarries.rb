# frozen_string_literal: true

module Mml
  module V4
    class Mscarries < Mml::V3::Mscarries
      attribute :scriptsizemultiplier, :integer
      attribute :mathbackground, :string
      attribute :mathcolor, :string
      attribute :position, :integer
      attribute :location, :string
      attribute :crossout, :string
      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        element "mscarries"
        mixed_content

        map_attribute "scriptsizemultiplier", to: :scriptsizemultiplier
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "position", to: :position
        map_attribute "location", to: :location
        map_attribute "crossout", to: :crossout
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
  end
end
