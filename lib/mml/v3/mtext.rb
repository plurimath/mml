# frozen_string_literal: true

module Mml
  module V3
    class Mtext < Lutaml::Model::Serializable
      include Base::Mtext
    end
    Configuration.register.register_model(Mtext, id: :mtext)
  end
end
