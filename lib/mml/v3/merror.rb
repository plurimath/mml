# frozen_string_literal: true

module Mml
  module V3
    class Merror < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathbackground, :string
      attribute :mathcolor, :string

      xml do
        namespace Namespace
        element "merror"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
      end
    end
    Configuration.register.register_model(Merror, id: :merror)
  end
end
