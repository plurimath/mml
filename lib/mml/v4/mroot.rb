# frozen_string_literal: true

module Mml
  module V4
    class Mroot < CommonElements
      include Base::Mroot
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
