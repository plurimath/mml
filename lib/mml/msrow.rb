# frozen_string_literal: true

require_relative "none"

module Mml
  class Msrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msrow)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "msrow"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "position", to: :position, namespace: nil

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag, to: :"#{tag}_value"
      end
    end
  end
end
