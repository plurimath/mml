# frozen_string_literal: true

module Mml::V3
  class Msup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :superscriptshift, :string

    xml do
      namespace Namespace
      element "msup"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "superscriptshift", to: :superscriptshift
    end
  end
end
