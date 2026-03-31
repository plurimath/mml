# frozen_string_literal: true

module Mml
  module V4
    class Msrow < Mml::V3::Msrow
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :position, :integer
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "msrow"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "position", to: :position
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
