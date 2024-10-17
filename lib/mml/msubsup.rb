# frozen_string_literal: true

module Mml
  class Msubsup < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:msubsup)

    SUPPORTED_TAGS = %w[
      munderover
      msubsup
      munder
      mstyle
      mtable
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
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string
    SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "msubsup"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "superscriptshift", to: :superscriptshift
      SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
