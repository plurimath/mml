# frozen_string_literal: true

module Mml
  module V2
    class Ms < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Ms
    end
  end
end
