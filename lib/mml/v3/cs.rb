# frozen_string_literal: true

module Mml
  module V3
    class Cs < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Cs
    end
    Configuration.register_model(Cs, id: :cs)
  end
end
