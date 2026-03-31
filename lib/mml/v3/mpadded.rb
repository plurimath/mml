# frozen_string_literal: true

module Mml
  module V3
    class Mpadded < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathbackground, :string
      attribute :mathcolor, :string
      attribute :voffset, :string
      attribute :height, :string
      attribute :lspace, :string
      attribute :depth, :string
      attribute :width, :string

      xml do
        namespace Namespace
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
    Configuration.register.register_model(Mpadded, id: :mpadded)
  end
end
