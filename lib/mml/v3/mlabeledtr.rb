# frozen_string_literal: true

module Mml
  module V3
    class Mlabeledtr < Lutaml::Model::Serializable
      include Base::Mlabeledtr
    end
    Configuration.register_model(Mlabeledtr, id: :mlabeledtr)
  end
end
