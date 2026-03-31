# frozen_string_literal: true

module Mml::V3
  class Mfraction < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :linethickness, :string
    attribute :numalign, :string
    attribute :denomalign, :string
    attribute :bevelled, :string

    xml do
      namespace Namespace
      element "mfraction"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "linethickness", to: :linethickness
      map_attribute "numalign", to: :numalign
      map_attribute "denomalign", to: :denomalign
      map_attribute "bevelled", to: :bevelled
    end
  end
end
