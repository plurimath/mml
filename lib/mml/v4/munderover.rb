# frozen_string_literal: true

module Mml
  module V4
    class Munderover < CommonElements
      include Base::Munderover
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Munderover, id: :munderover)
  end
end
