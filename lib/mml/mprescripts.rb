# frozen_string_literal: true

module Mml
  class Mprescripts < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      element "mprescripts"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
    end
  end
end
