# frozen_string_literal: true

module Mml
  module V4
    class Msrow < CommonElements
      include Base::Msrow
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
