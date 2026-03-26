# frozen_string_literal: true

module Mml
  class Msrow < Lutaml::Model::Serializable
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
end
