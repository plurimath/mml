# frozen_string_literal: true

module Mml
  class Mscarry < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :location, :string
    attribute :crossout, :string

    xml do
      namespace Namespace
      element "mscarry"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "location", to: :location
      map_attribute "crossout", to: :crossout
    end
  end
end
