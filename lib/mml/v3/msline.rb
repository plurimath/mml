# frozen_string_literal: true

module Mml
  module V3
    class Msline < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Msline
    end
  end
end
