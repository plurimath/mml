# frozen_string_literal: true

module Mml
  module V4
    class Mlongdiv < Mml::V3::Mlongdiv
      import_model CommonElements

      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
    Configuration.register.register_model(Mlongdiv, id: :mlongdiv)
  end
end
