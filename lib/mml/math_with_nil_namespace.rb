# frozen_string_literal: true

module Mml
  class MathWithNilNamespace < Lutaml::Model::Serializable
    attribute :display, :string

    xml do
      element "math"
      mixed_content

      map_attribute :display, to: :display
    end
  end
end
