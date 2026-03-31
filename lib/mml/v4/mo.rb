# frozen_string_literal: true

module Mml
  module V4
    class Mo < Mml::V3::Mo
      attribute :value, :string
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :mathvariant, :string
      attribute :mathsize, :string
      attribute :dir, :string
      attribute :fontfamily, :string
      attribute :fontweight, :string
      attribute :fontstyle, :string
      attribute :fontsize, :string
      attribute :color, :string
      attribute :background, :string
      attribute :form, :string
      attribute :fence, :string
      attribute :separator, :string
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
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      # rubocop:disable Metrics/BlockLength
      xml do
        namespace Namespace
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
        map_attribute "linebreak", to: :linebreak
        map_attribute "symmetric", to: :symmetric
        map_attribute "mathcolor", to: :mathcolor
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
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
      # rubocop:enable Metrics/BlockLength
    end
  end
end
