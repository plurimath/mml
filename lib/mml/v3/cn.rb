# frozen_string_literal: true

module Mml
  module V3
    class Cn < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Cn
    end
    Configuration.register_model(Cn, id: :cn)
  end
end
