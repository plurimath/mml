# frozen_string_literal: true

module Mml
  class Mphantom < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mphantom)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "mphantom"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
