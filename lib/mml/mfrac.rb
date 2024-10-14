# frozen_string_literal: true

module Mml
  class Mfrac < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mfrac)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :linethickness, :string
    attribute :numalign, :string
    attribute :denomalign, :string
    attribute :bevelled, :string

    xml do
      root "mfrac"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "linethickness", to: :linethickness
      map_attribute "numalign", to: :numalign
      map_attribute "denomalign", to: :denomalign
      map_attribute "bevelled", to: :bevelled
    end
  end
end
