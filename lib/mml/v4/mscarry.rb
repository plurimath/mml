# frozen_string_literal: true

module Mml
  module V4
    class Mscarry < Mml::V3::Mscarry
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :location, :string
      attribute :crossout, :string
      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        element "mscarry"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "location", to: :location
        map_attribute "crossout", to: :crossout
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
  end
end
