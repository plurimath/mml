# frozen_string_literal: true

module Mml
  module V3
    class Msgroup < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :position, :integer
      attribute :shift, :integer
      attribute :msgroup_text, :string

      xml do
        namespace Namespace
        element "msgroup"
        mixed_content

        map_content to: :msgroup_text
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "position", to: :position
        map_attribute "shift", to: :shift
      end
    end
    Configuration.register.register_model(Msgroup, id: :msgroup)
  end
end
