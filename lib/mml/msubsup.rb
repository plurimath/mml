# frozen_string_literal: true

module Mml
  class Msubsup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string

    xml do
      root "msubsup"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "superscriptshift", to: :superscriptshift
    end
  end
end
