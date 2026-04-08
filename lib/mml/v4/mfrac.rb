# frozen_string_literal: true

module Mml
  module V4
    class Mfrac < CommonElements
      include Base::Mfrac
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
