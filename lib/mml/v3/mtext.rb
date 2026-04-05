# frozen_string_literal: true

module Mml
  module V3
    class Mtext < Lutaml::Model::Serializable
      include Base::Mtext
      include Base::DeprecatedFontAttributes
    end
    Configuration.register_model(Mtext, id: :mtext)
  end
end
