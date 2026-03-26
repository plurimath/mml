# frozen_string_literal: true

module Mml
  autoload(:Mtd, "mml/mtd")

  class Mlabeledtr < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :columnalign, :string
    attribute :groupalign, :string
    attribute :mathcolor, :string
    attribute :rowalign, :string
    attribute :id, :string
    attribute :mtd_value, Mtd, collection: true

    xml do
      namespace Namespace
      element "mlabeledtr"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "columnalign", to: :columnalign
      map_attribute "groupalign", to: :groupalign
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "rowalign", to: :rowalign
      map_attribute "id", to: :id
      map_element "mtd", to: :mtd_value
    end
  end
end
