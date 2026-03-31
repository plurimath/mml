# frozen_string_literal: true

module Mml::V4
  class None < Mml::V3::None
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :intent, :string
    attribute :arg, :string

    xml do
      namespace Namespace
      element "none"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
    end
  end
end
