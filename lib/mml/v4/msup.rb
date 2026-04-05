# frozen_string_literal: true

module Mml
  module V4
    class Msup < CommonElements
      include Base::Msup
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Msup, id: :msup)
  end
end
