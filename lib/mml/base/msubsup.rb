# frozen_string_literal: true

module Mml
  module Base
    module Msubsup
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :subscriptshift, :string
          attribute :superscriptshift, :string

          xml do
            namespace Mml::Namespace
            element "msubsup"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "subscriptshift", to: :subscriptshift
            map_attribute "superscriptshift", to: :superscriptshift
          end
        end
      end
    end
  end
end
