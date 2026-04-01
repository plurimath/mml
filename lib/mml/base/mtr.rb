# frozen_string_literal: true

module Mml
  module Base
    module Mtr
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :rowalign, :string
          attribute :columnalign, :string
          attribute :mtd_value, :mtd, collection: true

          attribute :groupalign, :string

          xml do
            namespace Mml::Namespace
            element "mtr"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "rowalign", to: :rowalign
            map_attribute "columnalign", to: :columnalign
            map_element "mtd", to: :mtd_value

            map_attribute "groupalign", to: :groupalign
          end
        end
      end
    end
  end
end
