# frozen_string_literal: true

module Mml
  module Base
    module Content
      # interval represents an interval with optional closure type.
      module Interval
        def self.included(klass)
          klass.class_eval do
            attribute :closure, :string

            xml do
              namespace Mml::Namespace
              element "interval"
              mixed_content

              map_attribute "closure", to: :closure
            end
          end
        end
      end
    end
  end
end
