# frozen_string_literal: true

module Mml
  class Merror < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:merror)

    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "merror"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
end
