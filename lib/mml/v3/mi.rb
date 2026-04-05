# frozen_string_literal: true

module Mml
  module V3
    class Mi < Lutaml::Model::Serializable
      include Base::Mi
      include Base::DeprecatedFontAttributes
    end
    Configuration.register_model(Mi, id: :mi)
  end
end
