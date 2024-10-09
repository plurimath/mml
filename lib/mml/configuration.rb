# frozen_string_literal: true

require_relative "parser"

module Mml
  module Configuration
    class TypeError < StandardError; end
    class ConfigStruct < Struct; end

    def self.config
      # @config ||= set_config(Parser.serialized_classes)
      @config
    end

    def self.config=(config)
      type_error!("Hash", config.class) unless config.is_a?(Hash)

      # @config = set_config(Parser.serialized_classes.merge(config))
    end

    def self.adapter
      Lutaml::Model::Config.xml_adapter
    end

    def self.adapter=(adapter)
      Lutaml::Model::Config.configure do |config|
        require "lutaml/model/xml_adapter/#{adapter.downcase}_adapter"
        config.xml_adapter = Lutaml::Model::XmlAdapter.const_get("#{adapter.to_s.capitalize}Adapter")
      end
    end

    private

    def self.set_config(config)
      ConfigStruct.new(*config.keys).new(*config.values)
    end

    def self.type_error!(expected, actual)
      raise TypeError, "expected #{expected} but got #{actual}"
    end
  end
end
