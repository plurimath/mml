# frozen_string_literal: true

module Mml
  module V3
    class None < Lutaml::Model::Serializable
      include Base::None
    end
    Configuration.register_model(None, id: :none)
  end
end
