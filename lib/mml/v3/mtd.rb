# frozen_string_literal: true

module Mml
  module V3
    class Mtd < Lutaml::Model::Serializable
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :rowalign, :string
      attribute :columnalign, :string

      xml do
        namespace Namespace
        element "mtd"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "rowalign", to: :rowalign
        map_attribute "columnalign", to: :columnalign
      end
    end
  end
end
