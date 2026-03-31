# frozen_string_literal: true

module Mml
  module V3
    autoload(:Mprescripts, "mml/v3/mprescripts")

    class Mmultiscripts < Lutaml::Model::Serializable
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :subscriptshift, :string
      attribute :superscriptshift, :string
      attribute :mprescripts_value, Mprescripts

      xml do
        namespace Namespace
        element "mmultiscripts"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "subscriptshift", to: :subscriptshift
        map_attribute "superscriptshift", to: :superscriptshift
        map_element "mprescripts", to: :mprescripts_value
      end
    end
  end
end
