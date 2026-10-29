# frozen_string_literal: true

module Mml
  module Base
    module Content
      # MathML 4 wildcard attributes on content elements: every attribute
      # not explicitly mapped (data-*, on*, aria-*, ...) is captured into
      # `other_attributes` and emitted back on serialize (plurimath/mml#23).
      module WildcardAttributes
        def self.included(klass)
          klass.class_eval do
            attribute :other_attributes, :hash

            xml do
              namespace Mml::Namespace
              map_all_attributes to: :other_attributes
            end
          end
        end
      end
    end
  end
end
