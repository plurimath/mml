# frozen_string_literal: true

module Mml
  class Mfrac < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mfrac)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :linethickness, :string
    attribute :numalign, :string
    attribute :denomalign, :string
    attribute :bevelled, :string
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "mfrac"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "linethickness", to: :linethickness
      map_attribute "numalign", to: :numalign
      map_attribute "denomalign", to: :denomalign
      map_attribute "bevelled", to: :bevelled
      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
