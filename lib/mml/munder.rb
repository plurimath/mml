# frozen_string_literal: true

module Mml
  class Munder < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:munder)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :accentunder, :string
    attribute :align, :string

    xml do
      root "munder"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "accentunder", to: :accentunder
      map_attribute "align", to: :align
    end
  end
end
