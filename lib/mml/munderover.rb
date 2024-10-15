# frozen_string_literal: true

module Mml
  class Munderover < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:munderover)

    SUPPORTED_TAGS = %w[mi mo mn ms mtext mrow mstyle].freeze

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :accent, :string
    attribute :accentunder, :string
    attribute :align, :string
    SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "munderover"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "accent", to: :accent
      map_attribute "accentunder", to: :accentunder
      map_attribute "align", to: :align
      SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
