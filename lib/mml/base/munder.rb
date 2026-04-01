# frozen_string_literal: true

module Mml
  module Base
    module Munder
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :accentunder, :string
          attribute :mathcolor, :string
          attribute :content, :string
          attribute :align, :string

          xml do
            namespace Mml::Namespace
            element "munder"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "accentunder", to: :accentunder
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "align", to: :align
            map_content to: :content
          end
        end
      end
    end
  end
end
