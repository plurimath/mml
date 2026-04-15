# frozen_string_literal: true

module Mml
  module V3
    class Mtable < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mtable
      include Base::V3Only::TableAttributes
    end
    Configuration.register_model(Mtable, id: :mtable)
  end
end
