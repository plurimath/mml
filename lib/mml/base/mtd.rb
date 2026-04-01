# frozen_string_literal: true

module Mml
  module Base
    module Mtd
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :rowalign, :string
          attribute :columnalign, :string

          xml do
            namespace Mml::Namespace
            element "mtd"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "rowalign", to: :rowalign
            map_attribute "columnalign", to: :columnalign
          end
        end
      end
    end
  end
end
