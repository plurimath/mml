# frozen_string_literal: true

module Mml
  module V3
    class Malignmark < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Malignmark
    end
    Configuration.register_model(Malignmark, id: :malignmark)
  end
end
