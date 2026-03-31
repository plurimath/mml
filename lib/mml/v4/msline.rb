# frozen_string_literal: true

module Mml
  module V4
    class Msline < Mml::V3::Msline
      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register.register_model(Msline, id: :msline)
  end
end
