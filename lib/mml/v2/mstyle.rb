# frozen_string_literal: true

module Mml
  module V2
    class Mstyle < CommonElements
      include Base::Mstyle
      include Base::DeprecatedFontAttributes
    end
  end
end
