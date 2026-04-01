# frozen_string_literal: true

module Mml
  module V4
    class Msgroup < CommonElements
      include Base::Msgroup

      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register.register_model(Msgroup, id: :msgroup)
  end
end
