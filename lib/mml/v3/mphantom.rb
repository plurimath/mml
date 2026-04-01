# frozen_string_literal: true

module Mml
  module V3
    class Mphantom < CommonElements
      include Base::Mphantom
    end
    Configuration.register.register_model(Mphantom, id: :mphantom)
  end
end
