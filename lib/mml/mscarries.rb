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
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "position", to: :position, namespace: nil
      map_attribute "location", to: :location, namespace: nil
      map_attribute "crossout", to: :crossout, namespace: nil
      map_attribute "scriptsizemultiplier", to: :scriptsizemultiplier, namespace: nil
      map_element "none", to: :none
      map_element "mscarry", to: :mscarry
    end
  end
end
