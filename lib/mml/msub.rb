# frozen_string_literal: true

module Mml
  class Msubsup < Lutaml::Model::Serializable; end
  class Munder < Lutaml::Model::Serializable; end
  class Mover < Lutaml::Model::Serializable; end
  class Mfrac < Lutaml::Model::Serializable; end

  class Msub < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msub)

    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :mathcolor, :string
    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "msub"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "mathcolor", to: :mathcolor
      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
