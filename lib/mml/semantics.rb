# frozen_string_literal: true

module Mml
  autoload(:Mi, "mml/mi")

  class Semantics < Lutaml::Model::Serializable
    attribute :annotation, Mi, collection: true

    xml do
      namespace Namespace
      element "semantics"
      mixed_content

      map_element :annotation, to: :annotation
    end
  end
end
