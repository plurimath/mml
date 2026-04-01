# frozen_string_literal: true

module Mml
  module Base
    module Mprescripts
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string

          xml do
            namespace Mml::Namespace
            element "mprescripts"

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
          end
        end
      end
    end
  end
end
