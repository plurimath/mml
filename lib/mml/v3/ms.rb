# frozen_string_literal: true

module Mml
  module V3
    class Ms < CommonElements
      include Base::Ms
    end
    Configuration.register_model(Ms, id: :ms)
  end
end
