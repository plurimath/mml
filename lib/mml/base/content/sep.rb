# frozen_string_literal: true

module Mml
  module Base
    module Content
      # sep is used as a separator within cn elements for complex numbers.
      module Sep
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "sep"
            end
          end
        end
      end
    end
  end
end
