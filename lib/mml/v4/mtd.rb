# frozen_string_literal: true

module Mml
  module V4
    class Mtd < CommonElements
      include Base::Mtd
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
