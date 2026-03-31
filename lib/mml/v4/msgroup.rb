# frozen_string_literal: true

module Mml
  module V4
    class Msgroup < Mml::V3::Msgroup
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :position, :integer
      attribute :shift, :integer
      attribute :intent, :string
      attribute :arg, :string
      attribute :msgroup_text, :string

      xml do
        namespace Namespace
        element "msgroup"
        mixed_content

        map_content to: :msgroup_text
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "position", to: :position
        map_attribute "shift", to: :shift
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
  end
end
