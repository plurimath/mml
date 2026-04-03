# frozen_string_literal: true

module Mml
  module Base
    module Semantics
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :annotation, :mi, collection: true

          xml do
            namespace Mml::Namespace
            element "semantics"
            mixed_content

            map_element :annotation, to: :annotation
          end
        end
      end
    end
  end
end
