# frozen_string_literal: true

module Mml
  module V3
    class Mprescripts < Lutaml::Model::Serializable
      include Base::Mprescripts
    end
    Configuration.register.register_model(Mprescripts, id: :mprescripts)
  end
end
