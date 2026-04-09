# frozen_string_literal: true

module Mml
  module V3
    class Cbytes < Lutaml::Model::Serializable
      include Base::Content::Cbytes
    end
    Configuration.register_model(Cbytes, id: :cbytes)
  end
end
