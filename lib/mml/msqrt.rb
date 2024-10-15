# frozen_string_literal: true

module Mml
  class Msqrt < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msqrt)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "msqrt"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
