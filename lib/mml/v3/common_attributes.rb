# frozen_string_literal: true

module Mml::V3
  Mml::V3::Configuration::SUPPORTED_TAGS.each do |tag|
    autoload(tag.to_s.capitalize.to_sym, "mml/v3/#{tag}.rb")
  end

  class CommonAttributes < Lutaml::Model::Serializable
    Mml::V3::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml::V3.const_get(tag.to_s.capitalize),
                collection: true
    end

    xml do
      Mml::V3::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag, to: :"#{tag}_value"
      end
    end
  end
end
