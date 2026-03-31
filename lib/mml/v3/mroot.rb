# frozen_string_literal: true

module Mml
  module V3
    class Mroot < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string

      xml do
        namespace Namespace
        element "mroot"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
      end
    end
    Configuration.register.register_model(Mroot, id: :mroot)
  end
end
