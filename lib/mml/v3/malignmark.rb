# frozen_string_literal: true

module Mml
  module V3
    class Malignmark < Lutaml::Model::Serializable
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :edge, :string

      xml do
        namespace Namespace
        element "malignmark"

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "edge", to: :edge
      end
    end
    Configuration.register.register_model(Malignmark, id: :malignmark)
  end
end
