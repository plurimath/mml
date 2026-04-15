# frozen_string_literal: true

module Mml
  module V3
    class Cbytes < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Cbytes
    end
    Configuration.register_model(Cbytes, id: :cbytes)
  end
end
