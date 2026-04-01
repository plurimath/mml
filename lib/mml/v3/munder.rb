# frozen_string_literal: true

module Mml
  module V3
    class Munder < CommonElements
      include Base::Munder
    end
    Configuration.register.register_model(Munder, id: :munder)
  end
end
