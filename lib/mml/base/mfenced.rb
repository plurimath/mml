# frozen_string_literal: true

module Mml
  module Base
    module Mfenced
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :separators, :string
          attribute :mathcolor, :string
          attribute :content, :string
          attribute :close, :string
          attribute :open, :string

          xml do
            namespace Mml::Namespace
            element "mfenced"
            mixed_content

            map_content to: :content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "separators", to: :separators, render_empty: true
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "close", to: :close
            map_attribute "open", to: :open, render_empty: true
          end
        end
      end
    end
  end
end
