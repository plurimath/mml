# frozen_string_literal: true

module Mml
  module Base
    # V3-specific attributes that apply to multiple element types.
    # Includes dir attribute (v3+) and displaystyle/scriptlevel (v3+).
    module V3Common
      def self.included(klass)
        klass.class_eval do
          attribute :dir, :string
          include V3PresentationAttributes
        end
      end
    end
  end
end
