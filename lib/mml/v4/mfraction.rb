# frozen_string_literal: true

module Mml
  module V4
    class Mfraction < CommonElements
      include Base::Mfraction

      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register_model(Mfraction, id: :mfraction)
  end
end
