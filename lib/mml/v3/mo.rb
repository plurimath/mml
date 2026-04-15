# frozen_string_literal: true

module Mml
  module V3
    class Mo < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mo
      include Base::V3Common
      include Base::DeprecatedFontAttributes
      include Base::V3Only::OperatorAttributes
    end
    Configuration.register_model(Mo, id: :mo)
  end
end
