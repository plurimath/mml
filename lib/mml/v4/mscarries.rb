# frozen_string_literal: true

module Mml
  module V4
    class Mscarries < CommonElements
      include Base::Mscarries
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mscarries, id: :mscarries)
  end
end
