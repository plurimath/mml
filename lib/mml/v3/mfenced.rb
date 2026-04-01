# frozen_string_literal: true

module Mml
  module V3
    class Mfenced < CommonElements
      include Base::Mfenced
    end
    Configuration.register.register_model(Mfenced, id: :mfenced)
  end
end
