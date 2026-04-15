# frozen_string_literal: true

module Mml
  module V3
    class Mglyph < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Mglyph
      include Base::DeprecatedFontAttributes
    end
    Configuration.register_model(Mglyph, id: :mglyph)
  end
end
