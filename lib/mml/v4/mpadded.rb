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
  end
end
