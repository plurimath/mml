# frozen_string_literal: true

module Mml
  module V3
    class Maction < CommonElements
      include Base::Maction
    end
    Configuration.register_model(Maction, id: :maction)
  end
end
