# frozen_string_literal: true

module Mml
  class MathWithNamespace < Lutaml::Model::Serializable
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    attribute :display, :string

    xml do
      root "math", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", nil

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end

      map_attribute :display, to: :display
    end
  end
end
