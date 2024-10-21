# frozen_string_literal: true

require_relative "mscarries"
require_relative "msline"
require_relative "msrow"

module Mml
  class Msgroup < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msgroup)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :shift, :integer
    attribute :mscarries_value, Mscarries, collection: true
    attribute :msline_value, Msline, collection: true
    attribute :msrow_value, Msrow, collection: true
    attribute :msgroup_text, :string

    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "msgroup", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML"

      map_content to: :msgroup_text
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "position", to: :position, namespace: nil
      map_attribute "shift", to: :shift, namespace: nil
      map_element "mscarries", to: :mscarries_value
      map_element "msline", to: :msline_value
      map_element "msrow", to: :msrow_value
      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
