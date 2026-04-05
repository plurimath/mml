# frozen_string_literal: true

module Mml
  module V4
    class Mstack < CommonElements
      include Base::Mstack
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mstack, id: :mstack)
  end
end
