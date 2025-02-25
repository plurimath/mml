# frozen_string_literal: true

module Mml
  autoload(:Mprescripts, "mml/mprescripts")

  class Mmultiscripts < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string
    attribute :mprescripts_value, Mprescripts

    xml do
      root "mmultiscripts", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "subscriptshift", to: :subscriptshift, namespace: nil
      map_attribute "superscriptshift", to: :superscriptshift, namespace: nil
      map_element "mprescripts", to: :mprescripts_value
    end
  end
end
