# frozen_string_literal: true

module Mml
  class Msubsup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string

    xml do
      namespace Namespace
      element "msubsup"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "superscriptshift", to: :superscriptshift
    end
  end
end
