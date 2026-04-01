# frozen_string_literal: true

module Mml
  module V3
    class Mfrac < CommonElements
      include Base::Mfrac
    end
    Configuration.register.register_model(Mfrac, id: :mfrac)
  end
end
