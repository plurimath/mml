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
      root "mpadded", mixed: true

      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "voffset", to: :voffset, namespace: nil
      map_attribute "height", to: :height, namespace: nil
      map_attribute "lspace", to: :lspace, namespace: nil
      map_attribute "depth", to: :depth, namespace: nil
      map_attribute "width", to: :width, namespace: nil
    end
  end
end
