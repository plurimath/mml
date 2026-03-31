# frozen_string_literal: true

module Mml
  module V4
    class Msrow < Mml::V3::Msrow
      import_model CommonElements

      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
    Configuration.register.register_model(Msrow, id: :msrow)
  end
end
