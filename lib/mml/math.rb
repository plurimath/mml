# frozen_string_literal: true

require_relative "mi"
require_relative "mo"
require_relative "mn"
require_relative "ms"
require_relative "mrow"
require_relative "msup"
require_relative "msub"
require_relative "mtext"
require_relative "mfrac"
require_relative "msqrt"
require_relative "mover"
require_relative "mroot"
require_relative "mtable"
require_relative "munder"
require_relative "mstyle"
require_relative "mspace"
require_relative "mfenced"
require_relative "msubsup"
require_relative "msgroup"
require_relative "munderover"

module Mml
  class Math < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:math)

    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "math", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", nil

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
  end
end
