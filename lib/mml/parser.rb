# frozen_string_literal: true

require "lutaml/model"
require_relative "parser/math"
require_relative "parser/mtext"

module Mml
  module Parser
    def self.serialized_classes
      {
        math: Math,
        mtext: Mtext,
      }
    end
  end
end
