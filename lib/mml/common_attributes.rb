# frozen_string_literal: true

module Mml
  class CommonAttributes < Lutaml::Model::Serializable
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", tag.to_sym, collection: true
    end

    xml do
      no_root

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag, to: :"#{tag}_value"
      end
    end
  end
end
