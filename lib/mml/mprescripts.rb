# frozen_string_literal: true

module Mml
  class Mprescripts < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mprescripts)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "mprescripts"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
