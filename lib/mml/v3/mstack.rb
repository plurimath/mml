# frozen_string_literal: true

module Mml
  module V3
    class Mstack < CommonElements
      include Base::Mstack
    end
    Configuration.register.register_model(Mstack, id: :mstack)
  end
end
