# frozen_string_literal: true

module Mml
  class Munder < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :accentunder, :string
    attribute :mathcolor, :string
    attribute :content, :string
    attribute :align, :string

    xml do
      element "munder"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "accentunder", to: :accentunder
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "align", to: :align
      map_content to: :content
    end
  end
end
