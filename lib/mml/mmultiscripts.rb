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

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "superscriptshift", to: :superscriptshift
      map_element "none", to: :none
      map_element "mprescripts", to: :mprescripts
    end
  end
end
