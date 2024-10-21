# frozen_string_literal: true

module Mml
  class Mphantom < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mphantom)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "mphantom"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
end
