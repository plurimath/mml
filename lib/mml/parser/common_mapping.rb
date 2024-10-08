# frozen_string_literal: true

module Mml
  module Parser
    class CommonMapping < Lutaml::Model::Serializable
      attribute :mtext, Mtext

      xml do
        map_element :mtext, to: Mtext
      end
    end
  end
end