# frozen_string_literal: true

module Mml
  module V4
    autoload(:Mtd, "mml/v4/mtd")

    class Mtr < Mml::V3::Mtr
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :rowalign, :string
      attribute :columnalign, :string
      attribute :groupalign, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer
      attribute :mtd_value, Mtd, collection: true

      xml do
        namespace Namespace
        element "mtr"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "rowalign", to: :rowalign
        map_attribute "columnalign", to: :columnalign
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
        map_element "mtd", to: :mtd_value
      end
    end
  end
end
