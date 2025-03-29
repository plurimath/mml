# frozen_string_literal: true

module Mml
  Mml::Configuration::SUPPORTED_TAGS.each do |tag|
    # `autoload` is `require`, not `require_relative`
    autoload(tag.to_s.capitalize.to_sym, "mml/#{tag}.rb")
  end

  class CommonAttributes < Lutaml::Model::Serializable
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.to_s.capitalize),
                collection: true
    end

    xml do
      no_root

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag, to: :"#{tag}_value"
      end
    end
  end
end
