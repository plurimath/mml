# frozen_string_literal: true

module Mml
  class Munderover < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :accent, :string
    attribute :accentunder, :string
    attribute :align, :string

    xml do
      root "munderover", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "accent", to: :accent, namespace: nil
      map_attribute "accentunder", to: :accentunder, namespace: nil
      map_attribute "align", to: :align, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Munderover, id:  :munderover)
end
