# frozen_string_literal: true

module Mml::V3
  class Merror < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :mathcolor, :string

    xml do
      namespace Namespace
      element "merror"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
