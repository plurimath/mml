# frozen_string_literal: true

module Mml
  module V3
    class Maligngroup < Lutaml::Model::Serializable
      include Base::Maligngroup
    end
    Configuration.register.register_model(Maligngroup, id: :maligngroup)
  end
end
