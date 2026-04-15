# frozen_string_literal: true

module Mml
  module V3
    class Mprescripts < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mprescripts
    end
    Configuration.register_model(Mprescripts, id: :mprescripts)
  end
end
