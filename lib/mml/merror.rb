# frozen_string_literal: true

module Mml
  class Merror < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :mathcolor, :string

    xml do
      root "merror", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
end
