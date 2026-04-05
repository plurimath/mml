# frozen_string_literal: true

module Mml
  module V4
    class Mover < CommonElements
      include Base::Mover
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mover, id: :mover)
  end
end
