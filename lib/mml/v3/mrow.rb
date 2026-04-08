# frozen_string_literal: true

module Mml
  module V3
    class Mrow < CommonElements
      include Base::Mrow
      include Base::V3Common
    end
    Configuration.register_model(Mrow, id: :mrow)
  end
end
