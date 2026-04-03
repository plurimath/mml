# frozen_string_literal: true

module Mml
  module V3
    class Merror < CommonElements
      include Base::Merror
    end
    Configuration.register_model(Merror, id: :merror)
  end
end
