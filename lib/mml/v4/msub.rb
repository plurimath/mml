# frozen_string_literal: true

module Mml
  module V4
    class Msub < CommonElements
      include Base::Msub
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
