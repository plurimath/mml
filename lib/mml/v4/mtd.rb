# frozen_string_literal: true

module Mml
  module V4
    class Mtd < Mml::V3::Mtd
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :rowalign, :string
      attribute :columnalign, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "mtd"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "rowalign", to: :rowalign
        map_attribute "columnalign", to: :columnalign
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
