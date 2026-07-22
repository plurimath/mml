# frozen_string_literal: true

module Mml
  module V3
    class Mtr < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mtr
    end
  end
end
