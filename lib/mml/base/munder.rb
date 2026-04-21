# frozen_string_literal: true

module Mml
  module Base
    module Munder
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :accentunder, :string
          attribute :mathcolor, :string
          attribute :content, :string, collection: true
          attribute :align, :string

          xml do
            namespace Mml::Namespace
            element "munder"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "accentunder", to: :accentunder
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "align", to: :align
            map_content to: :content
          end
        end
      end
    end
  end
end
