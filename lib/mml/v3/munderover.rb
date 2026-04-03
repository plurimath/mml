# frozen_string_literal: true

module Mml
  module V3
    class Munderover < CommonElements
      include Base::Munderover
    end
    Configuration.register_model(Munderover, id: :munderover)
  end
end
