# frozen_string_literal: true

module Mml
  module V3
    class Maligngroup < Lutaml::Model::Serializable
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :groupalign, :string

      xml do
        namespace Namespace
        element "maligngroup"

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "groupalign", to: :groupalign
      end
    end
  end
end
