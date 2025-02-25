# frozen_string_literal: true

module Mml
  class Munder < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :accentunder, :string
    attribute :mathcolor, :string
    attribute :content, :string
    attribute :align, :string

    xml do
      root "munder", mixed: true

      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "accentunder", to: :accentunder, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "align", to: :align, namespace: nil
      map_content to: :content
    end
  end
end
