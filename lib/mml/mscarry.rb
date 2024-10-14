# frozen_string_literal: true

require_relative "none"

module Mml
  class Mscarry < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mscarry)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :location, :string
    attribute :crossout, :string
    attribute :none, None, collection: true

    xml do
      root "mscarry"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "location", to: :location
      map_attribute "crossout", to: :crossout
      map_element "none", to: :none
    end
  end
end
