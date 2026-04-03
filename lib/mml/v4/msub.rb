# frozen_string_literal: true

module Mml
  module V4
    class Msub < CommonElements
      include Base::Msub

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
    Configuration.register_model(Msub, id: :msub)
  end
end
