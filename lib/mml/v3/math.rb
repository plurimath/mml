# frozen_string_literal: true

module Mml
  module V3
    class Math < CommonElements
      include Base::Math
      include Base::V3Common
    end
    Configuration.register_model(Math, id: :math)

    MathWithNamespace = Math
  end
end
