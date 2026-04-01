# frozen_string_literal: true

module Mml
  module V3
    class Msgroup < CommonElements
      include Base::Msgroup
    end
    Configuration.register.register_model(Msgroup, id: :msgroup)
  end
end
