# frozen_string_literal: true

module Mml
  module V3
    class Mglyph < Lutaml::Model::Serializable
      include Base::Mglyph
    end
    Configuration.register_model(Mglyph, id: :mglyph)
  end
end
