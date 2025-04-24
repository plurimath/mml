# frozen_string_literal: true

module Mml
  class Mroot < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "mroot", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Mroot, id:  :mroot)
end
