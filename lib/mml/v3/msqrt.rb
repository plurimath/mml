# frozen_string_literal: true

module Mml
  module V3
    class Msqrt < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string

      xml do
        namespace Namespace
        element "msqrt"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
      end
    end
    Configuration.register.register_model(Msqrt, id: :msqrt)
  end
end
