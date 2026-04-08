# frozen_string_literal: true

module Mml
  module V3
    class Ci < Lutaml::Model::Serializable
      include Base::Content::Ci
    end
    Configuration.register_model(Ci, id: :ci)
  end
end
