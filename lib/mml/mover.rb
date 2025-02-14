# frozen_string_literal: true

module Mml
  class Mover < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :mathcolor, :string
    attribute :accent, :string
    attribute :align, :string

    xml do
      root "mover", mixed: true

      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "accent", to: :accent, namespace: nil
      map_attribute "align", to: :align, namespace: nil
    end
  end
end
