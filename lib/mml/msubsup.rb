# frozen_string_literal: true

module Mml
  class Msubsup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string

    xml do
      root "msubsup", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "subscriptshift", to: :subscriptshift, namespace: nil
      map_attribute "superscriptshift", to: :superscriptshift, namespace: nil
    end
  end
end
