# frozen_string_literal: true

module Mml
  module V3
    class Mroot < Lutaml::Model::Serializable
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
  end
end
