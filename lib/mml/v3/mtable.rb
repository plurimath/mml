# frozen_string_literal: true

module Mml
  module V3
    class Mtable < Lutaml::Model::Serializable
      include Base::Mtable
    end
    Configuration.register.register_model(Mtable, id: :mtable)
  end
end
