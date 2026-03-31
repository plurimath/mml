# frozen_string_literal: true

module Mml
  module V3
    class Mtr < Lutaml::Model::Serializable
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :rowalign, :string
      attribute :columnalign, :string
      attribute :groupalign, :string
      attribute :mtd_value, :mtd, collection: true

      xml do
        namespace Namespace
        element "mtr"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "rowalign", to: :rowalign
        map_attribute "columnalign", to: :columnalign
        map_attribute "groupalign", to: :groupalign
        map_element "mtd", to: :mtd_value
      end
    end
    Configuration.register.register_model(Mtr, id: :mtr)
  end
end
