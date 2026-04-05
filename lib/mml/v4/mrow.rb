# frozen_string_literal: true

module Mml
  module V4
    class Mrow < CommonElements
      include Base::Mrow
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mrow, id: :mrow)
  end
end
