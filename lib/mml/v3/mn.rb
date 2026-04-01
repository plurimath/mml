# frozen_string_literal: true

module Mml
  module V3
    class Mn < Lutaml::Model::Serializable
      include Base::Mn
    end
    Configuration.register.register_model(Mn, id: :mn)
  end
end
