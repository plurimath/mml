# frozen_string_literal: true

module Mml
  module V3
    class Math < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :display, :string

      xml do
        namespace Namespace
        element "math"
        mixed_content

        map_attribute :display, to: :display
      end
    end

    Configuration.register.register_model(Math, id: :math)

    # For backward compatibility, we keep MathWithNamespace as an alias to Math.
    MathWithNamespace = Math
  end
end
