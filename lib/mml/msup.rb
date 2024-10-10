# frozen_string_literal: true

module Mml
  class Msup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :superscriptshift, :string

    xml do
      root "msup"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "superscriptshift", to: :superscriptshift
    end
  end
end
