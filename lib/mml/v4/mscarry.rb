# frozen_string_literal: true

module Mml
  module V4
    class Mscarry < CommonElements
      include Base::Mscarry
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mscarry, id: :mscarry)
  end
end
