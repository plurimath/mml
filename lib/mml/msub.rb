# frozen_string_literal: true

module Mml
  class Msub < CommonAttributes
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :mathcolor, :string

    xml do
      root "msub", mixed: true

      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "subscriptshift", to: :subscriptshift, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Msub, id:  :msub)
end
