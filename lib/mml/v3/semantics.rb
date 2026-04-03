# frozen_string_literal: true

module Mml
  module V3
    class Semantics < CommonElements
      include Base::Semantics
    end
    Configuration.register_model(Semantics, id: :semantics)
  end
end
