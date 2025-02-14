# frozen_string_literal: true

module Mml
  class Msgroup < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer
    attribute :shift, :integer
    attribute :msgroup_text, :string

    xml do
      root "msgroup", mixed: true

      map_content to: :msgroup_text
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "position", to: :position, namespace: nil
      map_attribute "shift", to: :shift, namespace: nil
    end
  end
end
