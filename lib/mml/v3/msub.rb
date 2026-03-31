# frozen_string_literal: true

module Mml
  module V3
    class Msub < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathbackground, :string
      attribute :subscriptshift, :string
      attribute :mathcolor, :string

      xml do
        namespace Namespace
        element "msub"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "subscriptshift", to: :subscriptshift
        map_attribute "mathcolor", to: :mathcolor
      end
    end
    Configuration.register.register_model(Msub, id: :msub)
  end
end
