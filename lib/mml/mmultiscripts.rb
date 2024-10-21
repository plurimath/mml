# frozen_string_literal: true

require_relative "mprescripts"
require_relative "none"

module Mml
  class Mmultiscripts < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mmultiscripts)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string
    attribute :none, None, collection: true
    attribute :mprescripts, Mprescripts

    xml do
      root "mmultiscripts"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "subscriptshift", to: :subscriptshift, namespace: nil
      map_attribute "superscriptshift", to: :superscriptshift, namespace: nil
      map_element "none", to: :none
      map_element "mprescripts", to: :mprescripts
    end
  end
end
