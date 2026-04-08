# frozen_string_literal: true

module Mml
  module Base
    module Content
      # piecewise represents a piecewise expression with pieces and an otherwise case.
      module Piecewise
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "piecewise"
              mixed_content
            end
          end
        end
      end
    end
  end
end
