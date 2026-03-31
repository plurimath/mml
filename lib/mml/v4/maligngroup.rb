# frozen_string_literal: true

module Mml
  module V4
    class Maligngroup < Mml::V3::Maligngroup
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :groupalign, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "maligngroup"

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "groupalign", to: :groupalign
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
