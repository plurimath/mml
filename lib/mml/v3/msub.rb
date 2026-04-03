# frozen_string_literal: true

module Mml
  module V3
    class Msub < CommonElements
      include Base::Msub
    end
    Configuration.register_model(Msub, id: :msub)
  end
end
