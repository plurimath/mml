# frozen_string_literal: true

module Mml
  module V4
    class Mphantom < CommonElements
      include Base::Mphantom
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
