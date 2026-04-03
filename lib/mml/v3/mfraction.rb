# frozen_string_literal: true

module Mml
  module V3
    class Mfraction < CommonElements
      include Base::Mfraction
    end
    Configuration.register_model(Mfraction, id: :mfraction)
  end
end
