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
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "height", to: :height, namespace: nil
      map_attribute "depth", to: :depth, namespace: nil
      map_attribute "width", to: :width, namespace: nil
      map_attribute "lspace", to: :lspace, namespace: nil
      map_attribute "voffset", to: :voffset, namespace: nil
    end
  end
end
