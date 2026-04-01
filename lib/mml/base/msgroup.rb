# frozen_string_literal: true

module Mml
  module Base
    module Msgroup
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :position, :integer
          attribute :shift, :integer
          attribute :msgroup_text, :string

          xml do
            namespace Mml::Namespace
            element "msgroup"
            mixed_content

            map_content to: :msgroup_text
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "position", to: :position
            map_attribute "shift", to: :shift
          end
        end
      end
    end
  end
end
