# frozen_string_literal: true

module Mml
  module V4
    class Maction < Mml::V3::Maction
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :actiontype, :string
      attribute :selection, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "maction"

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "actiontype", to: :actiontype
        map_attribute "selection", to: :selection
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
