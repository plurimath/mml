# frozen_string_literal: true

module Mml
  module V3
    class Mi < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mi
      include Base::V3Common
      include Base::DeprecatedFontAttributes
    end
  end
end
