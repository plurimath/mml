# frozen_string_literal: true

module Mml
  class Mrow < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :mathcolor, :string
    attribute :content, :string
    attribute :intent, :string
    attribute :dir, :string

    xml do
      root "mrow", mixed: true

      map_content to: :content
      map_attribute "dir", to: :dir, namespace: nil
      map_attribute "intent", to: :intent, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
    end
  end
end
