# frozen_string_literal: true

require_relative "mscarries"
require_relative "msline"
require_relative "msrow"

module Mml
  class Msgroup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :shift, :integer
    attribute :mscarries, Mscarries, collection: true
    attribute :msline, Msline, collection: true
    attribute :msrow, Msrow, collection: true
    attribute :msgroup, Msgroup, collection: true

    xml do
      root "msgroup"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "position", to: :position
      map_attribute "shift", to: :shift
      map_element "mscarries", to: :mscarries
      map_element "msline", to: :msline
      map_element "msrow", to: :msrow
      map_element "msgroup", to: :msgroup
    end
  end
end
