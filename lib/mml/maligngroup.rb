# frozen_string_literal: true

module Mml
  class Maligngroup < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:maligngroup)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :groupalign, :string

    xml do
      root "maligngroup"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "groupalign", to: :groupalign
    end
  end
end
