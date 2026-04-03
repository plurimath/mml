# frozen_string_literal: true

module Mml
  module Base
    module Maligngroup
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :groupalign, :string

          xml do
            namespace Mml::Namespace
            element "maligngroup"

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "groupalign", to: :groupalign
          end
        end
      end
    end
  end
end
