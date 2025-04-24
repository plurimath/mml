# frozen_string_literal: true

module Mml
  class Msqrt < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "msqrt", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Msqrt, id:  :msqrt)
end
