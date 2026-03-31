# frozen_string_literal: true

module Mml::V3
  class Mscarries < Lutaml::Model::Serializable
    attribute :scriptsizemultiplier, :integer
    attribute :mathbackground, :string
    attribute :mathcolor, :string
    attribute :position, :integer
    attribute :location, :string
    attribute :crossout, :string

    xml do
      namespace Namespace
      element "mscarries"
      mixed_content

      map_attribute "scriptsizemultiplier", to: :scriptsizemultiplier
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "position", to: :position
      map_attribute "location", to: :location
      map_attribute "crossout", to: :crossout
    end
  end
end
