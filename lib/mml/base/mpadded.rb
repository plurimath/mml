# frozen_string_literal: true

module Mml
  module Base
    module Mpadded
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathbackground, :string
          attribute :mathcolor, :string
          attribute :voffset, :string
          attribute :height, :string
          attribute :lspace, :string
          attribute :rspace, :string
          attribute :depth, :string
          attribute :width, :string

          xml do
            namespace Mml::Namespace
            element "mpadded"
            mixed_content

            map_attribute "mathbackground", to: :mathbackground
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "voffset", to: :voffset
            map_attribute "height", to: :height
            map_attribute "lspace", to: :lspace
            map_attribute "rspace", to: :rspace
            map_attribute "depth", to: :depth
            map_attribute "width", to: :width
          end
        end
      end
    end
  end
end
