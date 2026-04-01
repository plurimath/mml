# frozen_string_literal: true

module Mml
  module V3
    class Msrow < CommonElements
      include Base::Msrow
    end
    Configuration.register.register_model(Msrow, id: :msrow)
  end
end
