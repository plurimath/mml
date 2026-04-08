# frozen_string_literal: true

module Mml
  module V4
    class Msgroup < CommonElements
      include Base::Msgroup
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
