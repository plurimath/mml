# frozen_string_literal: true

module Mml
  module V3
    class Msline < Lutaml::Model::Serializable
      include Base::Msline
    end
    Configuration.register.register_model(Msline, id: :msline)
  end
end
