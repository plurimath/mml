# frozen_string_literal: true

require_relative "none"

module Mml
  class Msrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msrow)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :none, None, collection: true

    xml do
      root "msrow"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "position", to: :position
      map_element "none", to: :none
    end
  end
end
