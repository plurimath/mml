# frozen_string_literal: true

module Mml
  class Malignmark < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :edge, :string

    xml do
      root "malignmark"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "edge", to: :edge, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Malignmark, id:  :malignmark)
end
