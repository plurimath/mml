# frozen_string_literal: true

module Mml
  module Base
    module Content
      # piece represents a case in a piecewise expression.
      module Piece
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "piece"
              mixed_content
            end
          end
        end
      end
    end
  end
end
