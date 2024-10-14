# frozen_string_literal: true

module Mml
  class Msub < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msub)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :subscriptshift, :string

    xml do
      root "msub"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
    end
  end
end
