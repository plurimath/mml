# frozen_string_literal: true

module Mml
  module V3
    class Mstyle < CommonElements
      include Base::Mstyle
      include Base::DeprecatedFontAttributes
      include Base::V3Only::StyleAttributes
    end
    Configuration.register_model(Mstyle, id: :mstyle)
  end
end
