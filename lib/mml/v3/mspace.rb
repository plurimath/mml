# frozen_string_literal: true

module Mml
  module V3
    class Mspace < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mspace
      include Base::DeprecatedFontAttributes
    end
    Configuration.register_model(Mspace, id: :mspace)
  end
end
