# frozen_string_literal: true

module Mml
  module V3
    class Mstack < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :align, :string
      attribute :stackalign, :string
      attribute :charalign, :string
      attribute :charspacing, :string

      xml do
        namespace Namespace
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
    Configuration.register.register_model(Mstack, id: :mstack)
  end
end
