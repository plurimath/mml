# frozen_string_literal: true

module Mml
  module Base
    module Content
      # degree is used to specify the degree for roots and derivatives.
      module Degree
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "degree"
              mixed_content
            end
          end
        end
      end
    end
  end
end
