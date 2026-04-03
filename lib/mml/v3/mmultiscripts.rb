# frozen_string_literal: true

module Mml
  module V3
    class Mmultiscripts < CommonElements
      include Base::Mmultiscripts
    end
    Configuration.register_model(Mmultiscripts, id: :mmultiscripts)
  end
end
