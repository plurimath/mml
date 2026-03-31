# frozen_string_literal: true

module Mml
  module V3
    class Mmultiscripts < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :subscriptshift, :string
      attribute :superscriptshift, :string
      attribute :mprescripts_value, :mprescripts

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
    Configuration.register.register_model(Mmultiscripts, id: :mmultiscripts)
  end
end
