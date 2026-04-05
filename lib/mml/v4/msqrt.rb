# frozen_string_literal: true

module Mml
  module V4
    class Msqrt < CommonElements
      include Base::Msqrt
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Msqrt, id: :msqrt)
  end
end
