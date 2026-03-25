# frozen_string_literal: true

module Mml
  class Maction < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :actiontype, :string
    attribute :selection, :string

    xml do
      element "maction"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "actiontype", to: :actiontype
      map_attribute "selection", to: :selection
    end
  end
end
