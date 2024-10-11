# frozen_string_literal: true

require_relative "mi"
require_relative "mrow"
require_relative "mstyle"

module Mml
  class Math < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:math)

    attribute :mi, Mi
    attribute :mrow, Mrow, collection: true
    attribute :mstyle, Mstyle, collection: true

    xml do
      root "math", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_element "mi", to: :mi
      map_element "mrow", to: :mrow
      map_element "mstyle", to: :mstyle
    end
  end
end
