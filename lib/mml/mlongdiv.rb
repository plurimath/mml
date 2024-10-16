# frozen_string_literal: true

require_relative "mscarries"
require_relative "msgroup"
require_relative "msline"
require_relative "msrow"

module Mml
  class Mlongdiv < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mlongdiv)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :shift, :integer
    attribute :longdivstyle, :string
    attribute :mscarries, Mscarries
    attribute :msline, Msline
    attribute :msrow, Msrow
    attribute :msgroup, Msgroup

    xml do
      root "mlongdiv"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "position", to: :position
      map_attribute "shift", to: :shift
      map_attribute "longdivstyle", to: :longdivstyle
      map_element "mscarries", to: :mscarries
      map_element "msline", to: :msline
      map_element "msrow", to: :msrow
      map_element "msgroup", to: :msgroup
    end
  end
end
