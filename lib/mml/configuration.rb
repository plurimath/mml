# frozen_string_literal: true

module Mml
  module Configuration
    # Sharing supported tags between models to avoid duplication
    # TODO: Find a better way to do this
    SUPPORTED_TAGS = %w[
      munderover
      msubsup
      mfenced
      munder
      mtable
      mstyle
      mfrac
      mover
      mroot
      mtext
      msqrt
      mrow
      msub
      msup
      mi
      mo
      mn
      ms
    ].freeze

    def config
      @config ||= {}
    end

    def config=(config)
      self.config.merge!(config)
    end

    def adapter
      Lutaml::Model::Config.xml_adapter
    end

    def adapter=(adapter)
      Lutaml::Model::Config.configure do |config|
        require "lutaml/model/xml_adapter/#{adapter.downcase}_adapter"
        config.xml_adapter = Lutaml::Model::XmlAdapter.const_get("#{adapter.to_s.capitalize}Adapter")
      end
    end

    def class_for(class_name)
      config[class_name]
    end

    module_function :config, :config=, :adapter, :adapter=, :class_for
  end
end
