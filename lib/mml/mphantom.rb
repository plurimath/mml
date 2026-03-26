# frozen_string_literal: true

module Mml
  class Mphantom < Lutaml::Model::Serializable
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
end
