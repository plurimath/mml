# frozen_string_literal: true

module Mml
  class None < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:none)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "none"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
