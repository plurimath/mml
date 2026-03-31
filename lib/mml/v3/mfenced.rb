# frozen_string_literal: true

module Mml::V3
  class Mfenced < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :separators, :string
    attribute :mathcolor, :string
    attribute :content, :string
    attribute :close, :string
    attribute :open, :string

    xml do
      namespace Namespace
      element "mfenced"
      mixed_content

      map_content to: :content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "separators", to: :separators
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "close", to: :close
      map_attribute "open", to: :open
    end
  end
end
