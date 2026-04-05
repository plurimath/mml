# frozen_string_literal: true

module Mml
  module V4
    class Mtable < Lutaml::Model::Serializable
      include Base::Mtable
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mtable, id: :mtable)
  end
end
