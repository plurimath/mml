# frozen_string_literal: true

module Mml
  module V3
    class Msup < CommonElements
      include Base::Msup
    end
    Configuration.register_model(Msup, id: :msup)
  end
end
