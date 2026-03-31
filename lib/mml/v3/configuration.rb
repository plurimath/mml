# frozen_string_literal: true

module Mml
  module V3
    module Configuration
      module_function

      def register
        @register ||= begin
          reg = Lutaml::Model::Register.new(:mml_v3)
          Lutaml::Model::GlobalRegister.register(reg)
          reg
        end
      end

      def register=(custom_register)
        Lutaml::Model::GlobalRegister.register(custom_register)
        @register = custom_register
      end

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
        Lutaml::Model::Config.xml_adapter_type = adapter
      end
    end
  end
end
