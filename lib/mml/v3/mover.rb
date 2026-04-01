# frozen_string_literal: true

module Mml
  module V3
    class Mover < CommonElements
      include Base::Mover
    end
    Configuration.register.register_model(Mover, id: :mover)
  end
end
