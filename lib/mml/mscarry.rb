# frozen_string_literal: true

module Mml
  class Mscarry < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :location, :string
    attribute :crossout, :string

    xml do
      root "mscarry", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "location", to: :location, namespace: nil
      map_attribute "crossout", to: :crossout, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Mscarry, id:  :mscarry)
end
