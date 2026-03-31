# frozen_string_literal: true

module Mml
  module V4
    autoload(:Mtd, "mml/v4/mtd")

    class Mlabeledtr < Mml::V3::Mlabeledtr
      attribute :mathbackground, :string
      attribute :columnalign, :string
      attribute :groupalign, :string
      attribute :mathcolor, :string
      attribute :rowalign, :string
      attribute :id, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :mtd_value, Mtd, collection: true

      xml do
        namespace Namespace
        element "mlabeledtr"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "columnalign", to: :columnalign
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "rowalign", to: :rowalign
        map_attribute "id", to: :id
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_element "mtd", to: :mtd_value
      end
    end
  end
end
