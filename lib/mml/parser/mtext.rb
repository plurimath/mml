# frozen_string_literal: true

module Mml
  module Parser
    class Mtext < Lutaml::Model::Serializable
      model Mml.config.mtext

      attribute :parameter_one, String

      xml do
        root "mtext", mixed: true

        map_content to: :parameter_one
      end
    end
  end
end
