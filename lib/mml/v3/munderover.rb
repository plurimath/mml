# frozen_string_literal: true

module Mml
  module V3
    class Munderover < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :accent, :string
      attribute :accentunder, :string
      attribute :align, :string

      xml do
        namespace Namespace
        element "munderover"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "accent", to: :accent
        map_attribute "accentunder", to: :accentunder
        map_attribute "align", to: :align
      end
    end
    Configuration.register.register_model(Munderover, id: :munderover)
  end
end
