# frozen_string_literal: true

module Mml
  class Msqrt < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msqrt)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "msqrt"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_attribute tag, to: :"#{tag}_value"
      end
    end
  end
end
