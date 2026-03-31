# frozen_string_literal: true

module Mml
  module V4
    Mml::V4::Configuration::SUPPORTED_TAGS.each do |tag|
      autoload(tag.to_s.capitalize.to_sym, "mml/v4/#{tag}.rb")
    end

    class CommonAttributes < Mml::V3::CommonAttributes
      Mml::V4::Configuration::SUPPORTED_TAGS.each do |tag|
        tag_class = if Mml::V3.const_defined?(tag.to_s.capitalize)
                      Mml::V3.const_get(tag.to_s.capitalize)
                    else
                      Mml::V4.const_get(tag.to_s.capitalize)
                    end
        attribute :"#{tag}_value", tag_class, collection: true
      end

      xml do
        Mml::V4::Configuration::SUPPORTED_TAGS.each do |tag|
          map_element tag, to: :"#{tag}_value"
        end
      end
    end
  end
end
