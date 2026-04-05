# frozen_string_literal: true

module Mml
  module V4
    class Msubsup < CommonElements
      include Base::Msubsup
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Msubsup, id: :msubsup)
  end
end
