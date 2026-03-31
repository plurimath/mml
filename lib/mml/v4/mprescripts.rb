# frozen_string_literal: true

module Mml::V4
  class Mprescripts < Mml::V3::Mprescripts
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :intent, :string
    attribute :arg, :string

    xml do
      namespace Namespace
      element "mprescripts"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
    end
  end
end
