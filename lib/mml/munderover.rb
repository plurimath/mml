# frozen_string_literal: true

module Mml
  class Munderover < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:munderover)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :accent, :string
    attribute :accentunder, :string
    attribute :align, :string
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "munderover"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "accent", to: :accent
      map_attribute "accentunder", to: :accentunder
      map_attribute "align", to: :align
      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
