# frozen_string_literal: true

module Mml
  autoload(:Mi, "mml/mi")

  class Semantics < CommonAttributes
    attribute :annotation, Mi, collection: true

    xml do
      root "semantics", mixed: true

      map_element :annotation, to: :annotation
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Semantics, id:  :semantics)
end
