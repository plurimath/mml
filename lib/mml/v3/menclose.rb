# frozen_string_literal: true

module Mml
  module V3
    class Menclose < CommonElements
      include Base::Menclose
    end
    Configuration.register_model(Menclose, id: :menclose)
  end
end
