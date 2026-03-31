# frozen_string_literal: true

module Mml
  module V4
    class Semantics < Mml::V3::Semantics
      import_model CommonElements

      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
    Configuration.register.register_model(Semantics, id: :semantics)
  end
end
