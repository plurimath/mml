# frozen_string_literal: true

module Mml
  module V3
    class Mover < Lutaml::Model::Serializable
      attribute :mathbackground, :string
      attribute :mathcolor, :string
      attribute :accent, :string
      attribute :align, :string

      xml do
        namespace Namespace
        element "mover"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "accent", to: :accent
        map_attribute "align", to: :align
      end
    end
  end
end
