# frozen_string_literal: true

module Mml
  module V4
    class Munder < CommonElements
      include Base::Munder
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
