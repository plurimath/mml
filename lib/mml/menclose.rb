# frozen_string_literal: true

module Mml
  class Menclose < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :notation, :string

    xml do
      root "menclose", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "notation", to: :notation, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Menclose, id:  :menclose)
end
