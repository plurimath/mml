# frozen_string_literal: true

module Mml
  class Mprescripts < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string

    xml do
      root "mprescripts"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
end
