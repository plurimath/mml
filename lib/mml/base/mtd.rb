# frozen_string_literal: true

module Mml
  module Base
    module Mtd
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :rowalign, :string
          attribute :columnalign, :string
          attribute :groupalign, :string
          attribute :rowspan, :integer
          attribute :columnspan, :integer

          xml do
            namespace Mml::Namespace
            element "mtd"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "rowalign", to: :rowalign
            map_attribute "columnalign", to: :columnalign
            map_attribute "groupalign", to: :groupalign
            map_attribute "rowspan", to: :rowspan
            map_attribute "columnspan", to: :columnspan
          end
        end
      end
    end
  end
end
