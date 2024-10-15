# frozen_string_literal: true

require_relative "mscarry"
require_relative "none"

module Mml
  class Mscarries < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mscarries)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :location, :string
    attribute :crossout, :string
    attribute :scriptsizemultiplier, :integer
    attribute :none, None, collection: true
    attribute :mscarry, Mscarry, collection: true

    xml do
      root "mscarries"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "position", to: :position
      map_attribute "location", to: :location
      map_attribute "crossout", to: :crossout
      map_attribute "scriptsizemultiplier", to: :scriptsizemultiplier
      map_element "none", to: :none
      map_element "mscarry", to: :mscarry
    end
  end
end
