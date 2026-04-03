# frozen_string_literal: true

module Mml
  module V3
    class Mrow < CommonElements
      include Base::Mrow
    end
    Configuration.register_model(Mrow, id: :mrow)
  end
end
