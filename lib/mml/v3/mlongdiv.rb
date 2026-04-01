# frozen_string_literal: true

module Mml
  module V3
    class Mlongdiv < CommonElements
      include Base::Mlongdiv
    end
    Configuration.register.register_model(Mlongdiv, id: :mlongdiv)
  end
end
