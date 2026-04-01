# frozen_string_literal: true

module Mml
  module Base
    module Mscarries
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :scriptsizemultiplier, :integer
          attribute :mathbackground, :string
          attribute :mathcolor, :string
          attribute :position, :integer
          attribute :location, :string
          attribute :crossout, :string

          xml do
            namespace Mml::Namespace
            element "mscarries"
            mixed_content

            map_attribute "scriptsizemultiplier", to: :scriptsizemultiplier
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "position", to: :position
            map_attribute "location", to: :location
            map_attribute "crossout", to: :crossout
          end
        end
      end
    end
  end
end
