# frozen_string_literal: true

module Mml
  module V3
    class Mn < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mn
      include Base::V3Common
      include Base::DeprecatedFontAttributes
    end
  end
end
