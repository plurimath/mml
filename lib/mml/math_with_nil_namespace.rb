# frozen_string_literal: true

module Mml
  class MathWithNilNamespace < CommonAttributes
    attribute :display, :string

    xml do
      root "math", mixed: true

      map_attribute :display, to: :display
    end
  end
end
