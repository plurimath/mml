# frozen_string_literal: true

module Mml
  module Base
    module Content
      # condition is used in qualifiers to specify conditions.
      module Condition
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "condition"
              mixed_content
            end
          end
        end
      end
    end
  end
end
