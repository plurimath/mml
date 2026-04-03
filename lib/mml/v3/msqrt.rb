# frozen_string_literal: true

module Mml
  module V3
    class Msqrt < CommonElements
      include Base::Msqrt
    end
    Configuration.register_model(Msqrt, id: :msqrt)
  end
end
