# frozen_string_literal: true

module Mml
  module V3
    class Mscarry < CommonElements
      include Base::Mscarry
    end
    Configuration.register_model(Mscarry, id: :mscarry)
  end
end
