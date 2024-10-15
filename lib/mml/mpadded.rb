# frozen_string_literal: true

module Mml
  class Mpadded < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mpadded)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :height, :string
    attribute :depth, :string
    attribute :width, :string
    attribute :lspace, :string
    attribute :voffset, :string

    xml do
      root "mpadded"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "height", to: :height
      map_attribute "depth", to: :depth
      map_attribute "width", to: :width
      map_attribute "lspace", to: :lspace
      map_attribute "voffset", to: :voffset
    end
  end
end
