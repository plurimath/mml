# frozen_string_literal: true

require_relative "mi"

module Mml
  class Mrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mrow)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :dir, :string
    attribute :mi, Mml::Mi

    xml do
      root "mrow"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "dir", to: :dir
      map_element "mi", to: :mi
    end
  end
end
