# frozen_string_literal: true

module Mml
  class Menclose < Lutaml::Model::Serializable
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
end
