# frozen_string_literal: true

module Mml
  module V4
    class Merror < CommonElements
      include Base::Merror
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
