# frozen_string_literal: true

module Mml::V3
  class Msub < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :mathcolor, :string

    xml do
      namespace Namespace
      element "msub"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "mathcolor", to: :mathcolor
    end
  end
end
