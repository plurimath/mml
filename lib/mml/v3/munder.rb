# frozen_string_literal: true

module Mml
  module V3
    class Munder < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathbackground, :string
      attribute :accentunder, :string
      attribute :mathcolor, :string
      attribute :content, :string
      attribute :align, :string

      xml do
        namespace Namespace
        element "munder"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "accentunder", to: :accentunder
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "align", to: :align
        map_content to: :content
      end
    end
    Configuration.register.register_model(Munder, id: :munder)
  end
end
