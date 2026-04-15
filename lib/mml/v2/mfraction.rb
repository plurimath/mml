# frozen_string_literal: true

module Mml
  module V2
    class Mfraction < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Mfraction
    end
  end
end
