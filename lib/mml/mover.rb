# frozen_string_literal: true

module Mml
  class Mover < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mover)

    SUPPORTED_TAGS = %w[
      munderover
      msubsup
      munder
      mstyle
      mtable
      mfrac
      mover
      msqrt
      mtext
      mrow
      msub
      msup
      mi
      mo
      mn
      ms
    ].freeze

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :accent, :string
    attribute :align, :string
    SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "mover"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "accent", to: :accent
      map_attribute "align", to: :align
      SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
