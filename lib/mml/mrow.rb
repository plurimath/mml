# frozen_string_literal: true

module Mml
  class Mrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mrow)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :dir, :string
    attribute :mrow, Mrow, collection: true
    attribute :ms, Ms
    attribute :mn, Mn
    attribute :mi, Mi
    attribute :mo, Mo

    xml do
      root "mrow"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_element "mi", to: :mi
      map_element "mo", to: :mo
      map_element "mn", to: :mn
      map_element "ms", to: :ms
      map_element "mrow", to: :mrow
      map_attribute "dir", to: :dir
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
