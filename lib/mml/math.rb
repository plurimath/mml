# frozen_string_literal: true

require_relative "mi"
require_relative "mo"
require_relative "mn"
require_relative "ms"
require_relative "mrow"
require_relative "mtext"
require_relative "mstyle"

module Mml
  class Math < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:math)

    attribute :mi, Mi
    attribute :mo, Mo
    attribute :mn, Mn
    attribute :ms, Ms
    attribute :mtext, Mtext
    attribute :mrow, Mrow, collection: true
    attribute :mstyle, Mstyle, collection: true

    xml do
      root "math", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_element "mi", to: :mi
      map_element "mo", to: :mo
      map_element "mn", to: :mn
      map_element "ms", to: :ms
      map_element "mrow", to: :mrow
      map_element "mtext", to: :mtext
      map_element "mstyle", to: :mstyle
    end
  end
end
