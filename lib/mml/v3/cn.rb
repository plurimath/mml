# frozen_string_literal: true

module Mml
  module V3
    class Cn < Lutaml::Model::Serializable
      include Base::Content::Cn
    end
    Configuration.register_model(Cn, id: :cn)
  end
end
