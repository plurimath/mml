# frozen_string_literal: true

module Mml
  module V4
    class Mpadded < CommonElements
      include Base::Mpadded
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mpadded, id: :mpadded)
  end
end
