# frozen_string_literal: true

module Mml
  class Merror < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:merror)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "merror"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
