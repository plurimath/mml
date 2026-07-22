# frozen_string_literal: true

module Mml
  module V3
    class None < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::None
    end
  end
end
