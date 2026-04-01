# frozen_string_literal: true

module Mml
  module V4
    class Mscarries < CommonElements
      include Base::Mscarries

      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register.register_model(Mscarries, id: :mscarries)
  end
end
