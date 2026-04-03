# frozen_string_literal: true

module Mml
  module Base
    module Msline
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :position, :integer
          attribute :length, :integer
          attribute :leftoverhang, :string
          attribute :rightoverhang, :string
          attribute :mslinethickness, :string

          xml do
            namespace Mml::Namespace
            element "msline"

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "position", to: :position
            map_attribute "length", to: :length
            map_attribute "leftoverhang", to: :leftoverhang
            map_attribute "rightoverhang", to: :rightoverhang
            map_attribute "mslinethickness", to: :mslinethickness
          end
        end
      end
    end
  end
end
