# frozen_string_literal: true

module Mml
  module Base
    module Mscarry
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :location, :string
          attribute :crossout, :string

          xml do
            namespace Mml::Namespace
            element "mscarry"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "location", to: :location
            map_attribute "crossout", to: :crossout
          end
        end
      end
    end
  end
end
