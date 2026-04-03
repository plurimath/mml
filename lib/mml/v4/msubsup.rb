# frozen_string_literal: true

module Mml
  module V4
    class Msubsup < CommonElements
      include Base::Msubsup

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
    Configuration.register_model(Msubsup, id: :msubsup)
  end
end
