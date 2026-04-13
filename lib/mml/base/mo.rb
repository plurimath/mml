# frozen_string_literal: true

module Mml
  module Base
    module Mo
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :value, :string
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :mathsize, :string
          attribute :form, :string
          attribute :lspace, :string
          attribute :rspace, :string
          attribute :stretchy, :string
          attribute :symmetric, :string
          attribute :maxsize, :string
          attribute :minsize, :string
          attribute :fence, :string
          attribute :largeop, :string
          attribute :movablelimits, :string
          attribute :accent, :string
          attribute :linebreak, :string
          attribute :lineleading, :string
          attribute :linebreakstyle, :string
          attribute :linebreakmultchar, :string
          attribute :indentalign, :string
          attribute :indentshift, :string
          attribute :indenttarget, :string
          attribute :indentalignfirst, :string
          attribute :indentshiftfirst, :string
          attribute :indentalignlast, :string
          attribute :indentshiftlast, :string

          # rubocop:disable Metrics/BlockLength
          xml do
            namespace Mml::Namespace
            element "mo"

            map_content to: :value
            map_attribute "form", to: :form
            map_attribute "accent", to: :accent
            map_attribute "lspace", to: :lspace
            map_attribute "rspace", to: :rspace
            map_attribute "maxsize", to: :maxsize
            map_attribute "minsize", to: :minsize
            map_attribute "fence", to: :fence
            map_attribute "largeop", to: :largeop
            map_attribute "stretchy", to: :stretchy
            map_attribute "linebreak", to: :linebreak
            map_attribute "symmetric", to: :symmetric
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathvariant", to: :mathvariant
            map_attribute "mathsize", to: :mathsize
            map_attribute "lineleading", to: :lineleading
            map_attribute "indentalign", to: :indentalign
            map_attribute "indentshift", to: :indentshift
            map_attribute "indenttarget", to: :indenttarget
            map_attribute "movablelimits", to: :movablelimits
            map_attribute "linebreakstyle", to: :linebreakstyle
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "indentalignlast", to: :indentalignlast
            map_attribute "indentshiftlast", to: :indentshiftlast
            map_attribute "indentalignfirst", to: :indentalignfirst
            map_attribute "indentshiftfirst", to: :indentshiftfirst
            map_attribute "linebreakmultchar", to: :linebreakmultchar
          end
          # rubocop:enable Metrics/BlockLength
        end
      end
    end
  end
end
