# frozen_string_literal: true

module Mml
  module Base
    module V3Only
      autoload :OperatorAttributes, "#{__dir__}/v3_only/operator_attrs"
      autoload :TableAttributes, "#{__dir__}/v3_only/table_attrs"
      autoload :StyleAttributes, "#{__dir__}/v3_only/style_attrs"
    end
  end
end
