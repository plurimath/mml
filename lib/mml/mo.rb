# frozen_string_literal: true

require_relative "malignmark"
require_relative "mglyph"

module Mml
  class Mo < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mo)

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
    attribute :mglyph, Mglyph, collection: true
    attribute :malignmark, Malignmark, collection: true

    # rubocop:disable Metrics/BlockLength
    xml do
      root "mo"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_content to: :value
      map_attribute "dir", to: :dir
      map_attribute "form", to: :form
      map_attribute "fence", to: :fence
      map_attribute "color", to: :color
      map_attribute "accent", to: :accent
      map_attribute "lspace", to: :lspace
      map_attribute "rspace", to: :rspace
      map_attribute "maxsize", to: :maxsize
      map_attribute "minsize", to: :minsize
      map_attribute "largeop", to: :largeop
      map_attribute "stretchy", to: :stretchy
      map_attribute "mathsize", to: :mathsize
      map_attribute "fontsize", to: :fontsize
      map_attribute "linebreak", to: :linebreak
      map_attribute "fontstyle", to: :fontstyle
      map_attribute "separator", to: :separator
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
      # map_element "mglyph", to: :mglyph
      # map_element "malignmark", to: :malignmark
    end
    # rubocop:enable Metrics/BlockLength
  end
end
