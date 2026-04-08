# frozen_string_literal: true

module Mml
  module Base
    module Content
      # lambda represents a lambda expression for creating anonymous functions.
      module Lambda
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "lambda"
              mixed_content
            end
          end
        end
      end
    end
  end
end
