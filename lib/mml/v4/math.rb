# frozen_string_literal: true

module Mml
  module V4
    class Math < CommonElements
      include Base::Math
      include Base::V3Common
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end

    MathWithNamespace = Math
  end
end
