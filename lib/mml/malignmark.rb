# frozen_string_literal: true

module Mml
  class Malignmark < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :edge, :string

    xml do
      root "malignmark"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "edge", to: :edge
    end
  end
end
