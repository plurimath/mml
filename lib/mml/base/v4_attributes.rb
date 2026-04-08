# frozen_string_literal: true

module Mml
  module Base
    # V4 attributes module (for backward compatibility).
    # Now composes UniversalPresentationAttributes + V4OnlyAttributes.
    module V4Attributes
      def self.included(klass)
        klass.class_eval do
          include UniversalPresentationAttributes
          include V4OnlyAttributes
        end
      end
    end
  end
end
