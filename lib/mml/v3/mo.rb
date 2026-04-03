# frozen_string_literal: true

module Mml
  module V3
    class Mo < Lutaml::Model::Serializable
      include Base::Mo
    end
    Configuration.register_model(Mo, id: :mo)
  end
end
