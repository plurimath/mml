# frozen_string_literal: true

module Mml
  module Base
    module Mlabeledtr
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :columnalign, :string
          attribute :mathcolor, :string
          attribute :rowalign, :string
          attribute :id, :string
          attribute :mtd_value, :mtd, collection: true

          xml do
            namespace Mml::Namespace
            element "mlabeledtr"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "columnalign", to: :columnalign
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "rowalign", to: :rowalign
            map_attribute "id", to: :id
            map_element "mtd", to: :mtd_value
          end
        end
      end
    end
  end
end
