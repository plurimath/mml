# frozen_string_literal: true

module Mml
  module V3
    class Mphantom < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string

      xml do
        namespace Namespace
        element "mphantom"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
      end
    end
    Configuration.register.register_model(Mphantom, id: :mphantom)
  end
end
