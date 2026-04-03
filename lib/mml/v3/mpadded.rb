# frozen_string_literal: true

module Mml
  module V3
    class Mpadded < CommonElements
      include Base::Mpadded
    end
    Configuration.register_model(Mpadded, id: :mpadded)
  end
end
