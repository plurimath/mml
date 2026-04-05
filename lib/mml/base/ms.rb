# frozen_string_literal: true

module Mml
  module Base
    module Ms
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :mathcolor, :string
          attribute :mathsize, :string
          attribute :lquote, :string
          attribute :rquote, :string
          attribute :value, :string
          attribute :dir, :string

          xml do
            namespace Mml::Namespace
            element "ms"
            mixed_content

            map_content to: :value
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathsize", to: :mathsize
            map_attribute "lquote", to: :lquote
            map_attribute "rquote", to: :rquote
            map_attribute "dir", to: :dir
          end
        end
      end
    end
  end
end
