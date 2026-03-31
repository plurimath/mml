# frozen_string_literal: true

module Mml
  module V4
    class Math < Mml::V3::Math
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "math"
        mixed_content

        map_attribute :display, to: :display
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end

    # For backward compatibility, we keep MathWithNamespace as an alias to Math.
    MathWithNamespace = Math
  end
end
