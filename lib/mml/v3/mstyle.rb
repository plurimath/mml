# frozen_string_literal: true

module Mml
  module V3
    class Mstyle < CommonElements
      include Base::Mstyle
    end
    Configuration.register_model(Mstyle, id: :mstyle)
  end
end
