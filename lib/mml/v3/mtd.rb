# frozen_string_literal: true

module Mml
  module V3
    class Mtd < CommonElements
      include Base::Mtd
    end
    Configuration.register_model(Mtd, id: :mtd)
  end
end
