# frozen_string_literal: true

module Mml
  module V3
    class Mspace < Lutaml::Model::Serializable
      include Base::Mspace
    end
    Configuration.register.register_model(Mspace, id: :mspace)
  end
end
