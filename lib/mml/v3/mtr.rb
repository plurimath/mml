# frozen_string_literal: true

module Mml
  module V3
    class Mtr < Lutaml::Model::Serializable
      include Base::Mtr
    end
    Configuration.register_model(Mtr, id: :mtr)
  end
end
