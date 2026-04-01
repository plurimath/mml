# frozen_string_literal: true

module Mml
  module Base
    module Mlongdiv
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :longdivstyle, :string
          attribute :mathcolor, :string
          attribute :position, :integer
          attribute :shift, :integer

          xml do
            namespace Mml::Namespace
            element "mlongdiv"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "longdivstyle", to: :longdivstyle
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "position", to: :position
            map_attribute "shift", to: :shift
          end
        end
      end
    end
  end
end
