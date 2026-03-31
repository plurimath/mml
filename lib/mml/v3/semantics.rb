# frozen_string_literal: true

module Mml
  module V3
    class Semantics < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :annotation, :mi, collection: true

      xml do
        namespace Namespace
        element "semantics"
        mixed_content

        map_element :annotation, to: :annotation
      end
    end
    Configuration.register.register_model(Semantics, id: :semantics)
  end
end
