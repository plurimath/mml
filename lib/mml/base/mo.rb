# frozen_string_literal: true

module Mml
  module Base
    module Mo
      # NOTE: Constants in class_eval resolve in the module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace) instead of bare constants.
      def self.included(klass)
        klass.class_eval do
          attribute :value, :string
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :mathvariant, :string
          attribute :mathsize, :string
          attribute :dir, :string
          # Deprecated in MathML 4
          attribute :fontfamily, :string
          attribute :fontweight, :string
          attribute :fontstyle, :string
          attribute :fontsize, :string
          attribute :background, :string
          attribute :form, :string
          attribute :lspace, :string
          attribute :rspace, :string
          attribute :stretchy, :string
          attribute :symmetric, :string
          attribute :maxsize, :string
          attribute :minsize, :string
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

          attribute :color, :string
          attribute :fence, :string
          attribute :separator, :string

          # rubocop:disable Metrics/BlockLength
          xml do
            namespace Mml::Namespace
            element "mo"

            map_content to: :value
            map_attribute "dir", to: :dir
            map_attribute "form", to: :form
            map_attribute "accent", to: :accent
            map_attribute "lspace", to: :lspace
            map_attribute "rspace", to: :rspace
            map_attribute "maxsize", to: :maxsize
            map_attribute "minsize", to: :minsize
            map_attribute "largeop", to: :largeop
            map_attribute "stretchy", to: :stretchy
            map_attribute "mathsize", to: :mathsize
            # Deprecated in MathML 4
            map_attribute "fontsize", to: :fontsize
            map_attribute "linebreak", to: :linebreak
            map_attribute "fontstyle", to: :fontstyle
            map_attribute "symmetric", to: :symmetric
            map_attribute "mathcolor", to: :mathcolor
            map_attribute "fontfamily", to: :fontfamily
            map_attribute "fontweight", to: :fontweight
            map_attribute "background", to: :background
            map_attribute "mathvariant", to: :mathvariant
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

            map_attribute "color", to: :color
            map_attribute "fence", to: :fence
            map_attribute "separator", to: :separator
          end
          # rubocop:enable Metrics/BlockLength
        end
      end
    end
  end
end
