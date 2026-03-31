# frozen_string_literal: true

module Mml
  module V4
    class Mtable < Mml::V3::Mtable
      attribute :intent, :string
      attribute :arg, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
    Configuration.register.register_model(Mtable, id: :mtable)
  end
end
