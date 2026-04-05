# frozen_string_literal: true

module Mml
  module V4
    class Math < CommonElements
      include Base::Math
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Math, id: :math)

    MathWithNamespace = Math
  end
end
