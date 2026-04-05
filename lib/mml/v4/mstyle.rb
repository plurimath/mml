# frozen_string_literal: true

module Mml
  module V4
    class Mstyle < CommonElements
      include Base::Mstyle
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mstyle, id: :mstyle)
  end
end
