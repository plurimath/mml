# frozen_string_literal: true

module Mml
  module V3
    class Csymbol < Lutaml::Model::Serializable
      include Base::Content::Csymbol
    end
    Configuration.register_model(Csymbol, id: :csymbol)
  end
end
