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
    Configuration.register_model(Msrow, id: :msrow)
  end
end
