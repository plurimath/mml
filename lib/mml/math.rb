# frozen_string_literal: true

require_relative "mi"
require_relative "mo"
require_relative "mn"
require_relative "ms"
require_relative "mrow"
require_relative "msup"
require_relative "msub"
require_relative "mtext"
require_relative "munder"
require_relative "mstyle"
require_relative "msubsup"
require_relative "munderover"

module Mml
  class Math < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:math)

    attribute :mi, Mi, collection: true
    attribute :mo, Mo, collection: true
    attribute :mn, Mn, collection: true
    attribute :ms, Ms, collection: true
    attribute :msub, Msub, collection: true
    attribute :mrow, Mrow, collection: true
    attribute :msup, Msup, collection: true
    attribute :mtext, Mtext, collection: true
    attribute :mover, Mover, collection: true
    attribute :munder, Munder, collection: true
    attribute :mstyle, Mstyle, collection: true
    attribute :msubsup, Msubsup, collection: true
    attribute :munderover, Munderover, collection: true

    xml do
      root "math", mixed: true
      # namespace "http://www.w3.org/1998/Math/MathML", nil

      map_element "mi", to: :mi
      map_element "mo", to: :mo
      map_element "mn", to: :mn
      map_element "ms", to: :ms
      map_element "msub", to: :msub
      map_element "mrow", to: :mrow
      map_element "msup", to: :msup
      map_element "mover", to: :mover
      map_element "mtext", to: :mtext
      map_element "mstyle", to: :mstyle
      map_element "munder", to: :munder
      map_element "msubsup", to: :msubsup
      map_element "munderover", to: :munderover
    end
  end
end
