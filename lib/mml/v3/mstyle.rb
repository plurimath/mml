# frozen_string_literal: true

module Mml
  module V3
    class Mstyle < CommonElements
      include Base::Mstyle
      include Base::V3Common
      include Base::DeprecatedFontAttributes
      include Base::V3Only::StyleAttributes
    end
  end
end
