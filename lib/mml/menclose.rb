# frozen_string_literal: true

module Mml
  class Menclose < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:menclose)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :notation, :string

    xml do
      root "menclose"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "notation", to: :notation
    end
  end
end
