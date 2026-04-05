# frozen_string_literal: true

module Mml
  module V3
    class Mo < Lutaml::Model::Serializable
      include Base::Mo
      include Base::DeprecatedFontAttributes
      include Base::V3Only::OperatorAttributes
    end
    Configuration.register_model(Mo, id: :mo)
  end
end
