# frozen_string_literal: true

module Mml
  class Msup < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :superscriptshift, :string

    xml do
      root "msup", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "superscriptshift", to: :superscriptshift, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Msup, id:  :msup)
end
