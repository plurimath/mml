# frozen_string_literal: true

module Mml
  module V3
    class Mroot < CommonElements
      include Base::Mroot
    end
    Configuration.register.register_model(Mroot, id: :mroot)
  end
end
