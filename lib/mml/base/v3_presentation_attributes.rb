# frozen_string_literal: true

module Mml
  module Base
    # V3 presentation attributes (displaystyle, scriptlevel).
    # These are universal in MathML 3 and later.
    module V3PresentationAttributes
      def self.included(klass)
        klass.class_eval do
          include UniversalPresentationAttributes
        end
      end
    end
  end
end
