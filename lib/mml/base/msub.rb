# frozen_string_literal: true

module Mml
  module Base
    module Msub
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :subscriptshift, :string
          attribute :mathcolor, :string

          xml do
            namespace Mml::Namespace
            element "msub"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "subscriptshift", to: :subscriptshift
            map_attribute "mathcolor", to: :mathcolor
          end
        end
      end
    end
  end
end
