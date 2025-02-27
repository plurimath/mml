# frozen_string_literal: true

module Mml
  class Msup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :superscriptshift, :string
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "msup", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "superscriptshift", to: :superscriptshift, namespace: nil
      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
