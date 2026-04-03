# frozen_string_literal: true

module Mml
  module Base
    module Mfraction
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :linethickness, :string
          attribute :numalign, :string
          attribute :denomalign, :string
          attribute :bevelled, :string

          xml do
            namespace Mml::Namespace
            element "mfraction"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "linethickness", to: :linethickness
            map_attribute "numalign", to: :numalign
            map_attribute "denomalign", to: :denomalign
            map_attribute "bevelled", to: :bevelled
          end
        end
      end
    end
  end
end
