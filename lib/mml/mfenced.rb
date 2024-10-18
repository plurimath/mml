# frozen_string_literal: true

module Mml
  class Mfenced < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mfenced)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :open, :string
    attribute :close, :string
    attribute :separators, :string
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "mfenced"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "open", to: :open
      map_attribute "close", to: :close
      map_attribute "separators", to: :separators

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
