# frozen_string_literal: true

module Mml
  class MathWithNamespace < Lutaml::Model::Serializable
    attribute :display, :string

    xml do
      root "math", mixed: true
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute :display, to: :display
    end
  end
end
