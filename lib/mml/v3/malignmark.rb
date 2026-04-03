# frozen_string_literal: true

module Mml
  module V3
    class Malignmark < Lutaml::Model::Serializable
      include Base::Malignmark
    end
    Configuration.register_model(Malignmark, id: :malignmark)
  end
end
