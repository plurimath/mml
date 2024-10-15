# frozen_string_literal: true

module Mml
  class Mover < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mover)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :accent, :string
    attribute :align, :string

    xml do
      root "mover"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "accent", to: :accent
      map_attribute "align", to: :align
    end
  end
end
