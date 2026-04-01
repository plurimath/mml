# frozen_string_literal: true

module Mml
  module Base
    module Mfenced
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
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
            map_attribute "separators", to: :separators
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "close", to: :close
            map_attribute "open", to: :open
          end
        end
      end
    end
  end
end
