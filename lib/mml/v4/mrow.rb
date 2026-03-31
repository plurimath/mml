# frozen_string_literal: true

module Mml
  module V4
    class Mrow < Mml::V3::Mrow
      import_model CommonElements

      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
    Configuration.register.register_model(Mrow, id: :mrow)
  end
end
