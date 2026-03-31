# frozen_string_literal: true

module Mml
  module V3
    class Msrow < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :position, :integer

      xml do
        namespace Namespace
        element "msrow"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "position", to: :position
      end
    end
    Configuration.register.register_model(Msrow, id: :msrow)
  end
end
