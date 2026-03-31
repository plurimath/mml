# frozen_string_literal: true

module Mml
  module V4
    class Mstyle < Mml::V3::Mstyle
      import_model CommonElements

      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register.register_model(Mstyle, id: :mstyle)
  end
end
