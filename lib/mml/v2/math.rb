# frozen_string_literal: true

module Mml
  module V2
    class Math < CommonElements
      include Base::Math
    end

    MathWithNamespace = Math
  end
end
