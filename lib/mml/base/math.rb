# frozen_string_literal: true

module Mml
  module Base
    module Math
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :display, :string
          attribute :alttext, :string
          attribute :macros, :string
          attribute :lang, :string
          attribute :bevelled, :string
          attribute :mathcolor, :string
          attribute :rowalign, :string
          attribute :columnalign, :string
          attribute :rowspacing, :string
          attribute :columnspacing, :string
          attribute :rowlines, :string
          attribute :columnlines, :string
          attribute :frame, :string
          # Linebreak attributes
          attribute :indentalign, :string
          attribute :indentshift, :string
          attribute :indentalignfirst, :string
          attribute :indentshiftfirst, :string
          attribute :indentalignlast, :string
          attribute :indentshiftlast, :string
          attribute :linebreakmultchar, :string

          xml do
            namespace Mml::Namespace
            element "math"
            mixed_content

            map_attribute :display, to: :display
            map_attribute "alttext", to: :alttext
            map_attribute :macros, to: :macros
            map_attribute "xml:lang", to: :lang
            map_attribute "bevelled", to: :bevelled
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "rowalign", to: :rowalign
            map_attribute "columnalign", to: :columnalign
            map_attribute "rowspacing", to: :rowspacing
            map_attribute "columnspacing", to: :columnspacing
            map_attribute "rowlines", to: :rowlines
            map_attribute "columnlines", to: :columnlines
            map_attribute "frame", to: :frame
            map_attribute "indentalign", to: :indentalign
            map_attribute "indentshift", to: :indentshift
            map_attribute "indentalignfirst", to: :indentalignfirst
            map_attribute "indentshiftfirst", to: :indentshiftfirst
            map_attribute "indentalignlast", to: :indentalignlast
            map_attribute "indentshiftlast", to: :indentshiftlast
            map_attribute "linebreakmultchar", to: :linebreakmultchar
          end
        end
      end
    end
  end
end
