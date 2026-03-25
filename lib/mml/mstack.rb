# frozen_string_literal: true

module Mml
  class Mstack < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :align, :string
    attribute :stackalign, :string
    attribute :charalign, :string
    attribute :charspacing, :string

    xml do
      element "mstack"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "align", to: :align
      map_attribute "stackalign", to: :stackalign
      map_attribute "charalign", to: :charalign
      map_attribute "charspacing", to: :charspacing
    end
  end
end
