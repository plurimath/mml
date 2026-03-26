# frozen_string_literal: true

module Mml
  class Math < Lutaml::Model::Serializable
    attribute :display, :string

    xml do
      namespace Namespace
      element "math"
      mixed_content

      map_attribute :display, to: :display
    end
  end

  # For backward compatibility, we keep MathWithNamespace as an alias to Math.
  MathWithNamespace = Math
end
