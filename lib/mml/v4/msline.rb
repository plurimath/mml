# frozen_string_literal: true

module Mml::V4
  class Msline < Mml::V3::Msline
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :length, :integer
    attribute :leftoverhang, :string
    attribute :rightoverhang, :string
    attribute :mslinethickness, :string
    attribute :intent, :string
    attribute :arg, :string

    xml do
      namespace Namespace
      element "msline"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "position", to: :position
      map_attribute "length", to: :length
      map_attribute "leftoverhang", to: :leftoverhang
      map_attribute "rightoverhang", to: :rightoverhang
      map_attribute "mslinethickness", to: :mslinethickness
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
    end
  end
end
