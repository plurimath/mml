# frozen_string_literal: true

module Mml::V3
  class Menclose < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :notation, :string

    xml do
      namespace Namespace
      element "menclose"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "notation", to: :notation
    end
  end
end
