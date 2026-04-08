# frozen_string_literal: true

module Mml
  module Base
    module Mrow
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :mathcolor, :string
          attribute :content, :string

          xml do
            namespace Mml::Namespace
            element "mrow"
            mixed_content

            map_content to: :content
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
          end
        end
      end
    end
  end
end
