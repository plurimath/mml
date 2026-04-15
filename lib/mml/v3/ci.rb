# frozen_string_literal: true

module Mml
  module V3
    class Ci < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Ci
    end
    Configuration.register_model(Ci, id: :ci)
  end
end
