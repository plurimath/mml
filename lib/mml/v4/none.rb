# frozen_string_literal: true

module Mml
  module V4
    class None < Mml::V3::None
      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register.register_model(None, id: :none)
  end
end
