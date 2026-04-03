# frozen_string_literal: true

module Mml
  module Base
    module Munderover
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :accent, :string
          attribute :accentunder, :string
          attribute :align, :string

          xml do
            namespace Mml::Namespace
            element "munderover"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "accent", to: :accent
            map_attribute "accentunder", to: :accentunder
            map_attribute "align", to: :align
          end
        end
      end
    end
  end
end
