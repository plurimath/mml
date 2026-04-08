# frozen_string_literal: true

module Mml
  module V4
    class Menclose < CommonElements
      include Base::Menclose
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
