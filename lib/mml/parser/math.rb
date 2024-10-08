# frozen_string_literal: true

require_relative "common_mapping"

module Mml
  module Parser
    class Math < CommonMapping
      model Mml.config.math

      xml do
        root "math", mixed: true
      end
    end
  end
end
