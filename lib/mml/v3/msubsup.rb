# frozen_string_literal: true

module Mml
  module V3
    class Msubsup < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :subscriptshift, :string
      attribute :superscriptshift, :string

      xml do
        namespace Namespace
        element "msubsup"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "subscriptshift", to: :subscriptshift
        map_attribute "superscriptshift", to: :superscriptshift
      end
    end
    Configuration.register.register_model(Msubsup, id: :msubsup)
  end
end
