# frozen_string_literal: true

module Mml
  autoload(:Mi, "mml/mi")

  class Semantics < Lutaml::Model::Serializable
    attribute :annotation, Mi, collection: true

    xml do
      root "semantics", mixed: true

      map_element :annotation, to: :annotation
    end
  end
end
