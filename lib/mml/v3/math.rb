# frozen_string_literal: true

module Mml
  module V3
    class Math < CommonElements
      include Base::Math
    end
    Configuration.register.register_model(Math, id: :math)

    # For backward compatibility, we keep MathWithNamespace as an alias to Math.
    MathWithNamespace = Math
  end
end
