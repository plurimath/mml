# frozen_string_literal: true

module Mml
  class Mpadded < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :mathcolor, :string
    attribute :voffset, :string
    attribute :height, :string
    attribute :lspace, :string
    attribute :depth, :string
    attribute :width, :string

    xml do
      element "mpadded"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "voffset", to: :voffset
      map_attribute "height", to: :height
      map_attribute "lspace", to: :lspace
      map_attribute "depth", to: :depth
      map_attribute "width", to: :width
    end
  end
end
