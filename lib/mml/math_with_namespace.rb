# frozen_string_literal: true

module Mml
  class MathWithNamespace < Lutaml::Model::Serializable
    attribute :display, :string

    xml do
      element "math"
      mixed_content
      namespace Namespace

      map_attribute :display, to: :display
    end
  end
end
