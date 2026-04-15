# frozen_string_literal: true

module Mml
  module V3
    class Mtext < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mtext
      include Base::V3Common
      include Base::DeprecatedFontAttributes
    end
    Configuration.register_model(Mtext, id: :mtext)
  end
end
