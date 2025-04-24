# frozen_string_literal: true

module Mml
  autoload(:Mtd, "mml/mtd")

  class Mtr < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :rowalign, :string
    attribute :columnalign, :string
    attribute :groupalign, :string
    attribute :mtd_value, Mtd, collection: true

    xml do
      root "mtr", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "rowalign", to: :rowalign, namespace: nil
      map_attribute "columnalign", to: :columnalign, namespace: nil
      map_attribute "groupalign", to: :groupalign, namespace: nil
      map_element "mtd", to: :mtd_value
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Mtr, id:  :mtr)
end
