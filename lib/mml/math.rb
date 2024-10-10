# frozen_string_literal: true

require_relative "mi"
require_relative "mrow"

module Mml
  class Math < Lutaml::Model::Serializable
    model Plurimath::Math::Formula

    attribute :mi, Mi
    attribute :mrow, Mrow

    xml do
      root "math", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_element "mi", to: :mi
      map_element "mrow", to: :mrow
    end
  end
end
