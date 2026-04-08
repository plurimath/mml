# frozen_string_literal: true

module Mml
  module Base
    module Content
      # otherwise represents the default case in a piecewise expression.
      module Otherwise
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "otherwise"
              mixed_content
            end
          end
        end
      end
    end
  end
end
