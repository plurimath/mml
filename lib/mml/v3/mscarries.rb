# frozen_string_literal: true

module Mml
  module V3
    class Mscarries < CommonElements
      include Base::Mscarries
    end
    Configuration.register_model(Mscarries, id: :mscarries)
  end
end
