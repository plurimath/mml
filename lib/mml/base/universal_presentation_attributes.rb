# frozen_string_literal: true

module Mml
  module Base
    # Universal MathML presentation attributes allowed on all presentation elements.
    # These exist in MathML 3 and later (displaystyle, scriptlevel were introduced in v3).
    module UniversalPresentationAttributes
      def self.included(klass)
        klass.class_eval do
          attribute :displaystyle, :string
          attribute :scriptlevel, :integer
          attribute :mathcolor, :string
          attribute :mathbackground, :string

          xml do
            namespace Mml::Namespace
            map_attribute "displaystyle", to: :displaystyle
            map_attribute "scriptlevel", to: :scriptlevel
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
          end
        end
      end
    end

    # V4-only attributes not present in V3.
    module V4OnlyAttributes
      def self.included(klass)
        klass.class_eval do
          attribute :intent, :string
          attribute :arg, :string

          xml do
            namespace Mml::Namespace
            map_attribute "intent", to: :intent
            map_attribute "arg", to: :arg
          end
        end
      end
    end
  end
end
