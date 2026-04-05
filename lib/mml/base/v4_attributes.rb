# frozen_string_literal: true

module Mml
  module Base
    # Universal MathML 4 attributes (V4-only, not in V3).
    # intent, arg, displaystyle, scriptlevel, mathcolor, mathbackground.
    module V4Attributes
      def self.included(klass)
        klass.class_eval do
          attribute :intent, :string
          attribute :arg, :string
          attribute :displaystyle, :string
          attribute :scriptlevel, :integer
          attribute :mathcolor, :string
          attribute :mathbackground, :string

          xml do
            namespace Mml::Namespace
            map_attribute "intent", to: :intent
            map_attribute "arg", to: :arg
            map_attribute "displaystyle", to: :displaystyle
            map_attribute "scriptlevel", to: :scriptlevel
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
          end
        end
      end
    end
  end
end
