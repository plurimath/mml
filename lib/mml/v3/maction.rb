# frozen_string_literal: true

module Mml
  module V3
    class Maction < Lutaml::Model::Serializable
      include Base::Maction
    end
    Configuration.register_model(Maction, id: :maction)
  end
end
