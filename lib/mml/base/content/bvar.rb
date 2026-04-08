# frozen_string_literal: true

module Mml
  module Base
    module Content
      # bvar represents a bound variable in a binding expression.
      module Bvar
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "bvar"
              mixed_content
            end
          end
        end
      end
    end
  end
end
