# frozen_string_literal: true

module Mml
  module V3
    class Mlabeledtr < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mlabeledtr
    end
    Configuration.register_model(Mlabeledtr, id: :mlabeledtr)
  end
end
