# frozen_string_literal: true

module Mml
  module V3
    class Maligngroup < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Maligngroup
    end
    Configuration.register_model(Maligngroup, id: :maligngroup)
  end
end
