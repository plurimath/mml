# frozen_string_literal: true

module Mml
  module V3
    class Mn < Lutaml::Model::Serializable
      include Base::Mn
      include Base::V3Common
      include Base::DeprecatedFontAttributes
    end
    Configuration.register_model(Mn, id: :mn)
  end
end
