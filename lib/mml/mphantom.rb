# frozen_string_literal: true

module Mml
  class Mphantom < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mphantom)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "mphantom"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
