# frozen_string_literal: true

module Mml
  module V4
    class Maction < CommonElements
      include Base::Maction
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
