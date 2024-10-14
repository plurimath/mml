# frozen_string_literal: true

require_relative "mscarries"
require_relative "msgroup"
require_relative "msline"
require_relative "msrow"

module Mml
  class Mstack < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mstack)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :align, :string
    attribute :stackalign, :string
    attribute :charalign, :string
    attribute :charspacing, :string
    attribute :mscarries, Mscarries, collection: true
    attribute :msline, Msline, collection: true
    attribute :msrow, Msrow, collection: true
    attribute :msgroup, Msgroup, collection: true

    xml do
      root "mstack"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "align", to: :align
      map_attribute "stackalign", to: :stackalign
      map_attribute "charalign", to: :charalign
      map_attribute "charspacing", to: :charspacing
      map_element "mscarries", to: :mscarries
      map_element "msline", to: :msline
      map_element "msrow", to: :msrow
      map_element "msgroup", to: :msgroup
    end
  end
end
