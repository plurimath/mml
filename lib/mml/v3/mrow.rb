# frozen_string_literal: true

module Mml::V3
  class Mrow < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :mathcolor, :string
    attribute :content, :string
    attribute :intent, :string
    attribute :dir, :string

    xml do
      namespace Namespace
      element "mrow"
      mixed_content

      map_content to: :content
      map_attribute "dir", to: :dir
      map_attribute "intent", to: :intent
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
