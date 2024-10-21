# frozen_string_literal: true

module Mml
  class Maligngroup < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:maligngroup)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :groupalign, :string

    xml do
      root "maligngroup"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "groupalign", to: :groupalign, namespace: nil
    end
  end
end
