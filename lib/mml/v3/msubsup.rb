# frozen_string_literal: true

module Mml
  module V3
    class Msubsup < CommonElements
      include Base::Msubsup
    end
    Configuration.register.register_model(Msubsup, id: :msubsup)
  end
end
