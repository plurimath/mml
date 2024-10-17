# frozen_string_literal: true

module Mml
  # rubocop:disable Metrics/ClassLength
  class Mstyle < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mstyle)

    SUPPORTED_TAGS = %w[
      munderover
      msubsup
      mtable
      munder
      mstyle
      msqrt
      mfrac
      mover
      mtext
      mrow
      msub
      msup
      mi
      mo
      mn
      ms
    ].freeze

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :scriptlevel, :integer
    attribute :displaystyle, :string
    attribute :scriptsizemultiplier, :integer
    attribute :scriptminsize, :string
    attribute :infixlinebreakstyle, :string
    attribute :decimalpoint, :string
    attribute :accent, :string
    attribute :accentunder, :string
    attribute :align, :string
    attribute :alignmentscope, :string
    attribute :bevelled, :string
    attribute :charalign, :string
    attribute :charspacing, :string
    attribute :close, :string
    attribute :columnalign, :string
    attribute :columnlines, :string
    attribute :columnspacing, :string
    attribute :columnspan, :integer
    attribute :columnwidth, :string
    attribute :crossout, :string
    attribute :denomalign, :string
    attribute :depth, :string
    attribute :dir, :string
    attribute :edge, :string
    attribute :equalcolumns, :string
    attribute :equalrows, :string
    attribute :fence, :string
    attribute :form, :string
    attribute :frame, :string
    attribute :framespacing, :string
    attribute :groupalign, :string
    attribute :height, :string
    attribute :indentalign, :string
    attribute :indentalignfirst, :string
    attribute :indentalignlast, :string
    attribute :indentshift, :string
    attribute :indentshiftfirst, :string
    attribute :indentshiftlast, :string
    attribute :indenttarget, :string
    attribute :largeop, :string
    attribute :leftoverhang, :string
    attribute :length, :integer
    attribute :linebreak, :string
    attribute :linebreakmultchar, :string
    attribute :linebreakstyle, :string
    attribute :lineleading, :string
    attribute :linethickness, :string
    attribute :location, :string
    attribute :longdivstyle, :string
    attribute :lquote, :string
    attribute :lspace, :string
    attribute :mathsize, :string
    attribute :mathvariant, :string
    attribute :maxsize, :string
    attribute :minlabelspacing, :string
    attribute :minsize, :string
    attribute :movablelimits, :string
    attribute :mslinethickness, :string
    attribute :notation, :string
    attribute :numalign, :string
    attribute :open, :string
    attribute :position, :integer
    attribute :rightoverhang, :string
    attribute :rowalign, :string
    attribute :rowlines, :string
    attribute :rowspacing, :string
    attribute :rowspan, :integer
    attribute :rquote, :string
    attribute :rspace, :string
    attribute :selection, :integer
    attribute :separator, :string
    attribute :separators, :string
    attribute :shift, :integer
    attribute :side, :string
    attribute :stackalign, :string
    attribute :stretchy, :string
    attribute :subscriptshift, :string
    attribute :superscriptshift, :string
    attribute :symmetric, :string
    attribute :valign, :string
    attribute :width, :string
    attribute :fontfamily, :string
    attribute :fontweight, :string
    attribute :fontstyle, :string
    attribute :fontsize, :string
    attribute :color, :string
    attribute :background, :string
    attribute :veryverythinmathspace, :string
    attribute :verythinmathspace, :string
    attribute :thinmathspace, :string
    attribute :mediummathspace, :string
    attribute :thickmathspace, :string
    attribute :verythickmathspace, :string
    attribute :veryverythickmathspace, :string
    SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    # rubocop:disable Metrics/BlockLength
    xml do
      root "mstyle"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "scriptlevel", to: :scriptlevel
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptsizemultiplier", to: :scriptsizemultiplier
      map_attribute "scriptminsize", to: :scriptminsize
      map_attribute "infixlinebreakstyle", to: :infixlinebreakstyle
      map_attribute "decimalpoint", to: :decimalpoint
      map_attribute "accent", to: :accent
      map_attribute "accentunder", to: :accentunder
      map_attribute "align", to: :align
      map_attribute "alignmentscope", to: :alignmentscope
      map_attribute "bevelled", to: :bevelled
      map_attribute "charalign", to: :charalign
      map_attribute "charspacing", to: :charspacing
      map_attribute "close", to: :close
      map_attribute "columnalign", to: :columnalign
      map_attribute "columnlines", to: :columnlines
      map_attribute "columnspacing", to: :columnspacing
      map_attribute "columnspan", to: :columnspan
      map_attribute "columnwidth", to: :columnwidth
      map_attribute "crossout", to: :crossout
      map_attribute "denomalign", to: :denomalign
      map_attribute "depth", to: :depth
      map_attribute "dir", to: :dir
      map_attribute "edge", to: :edge
      map_attribute "equalcolumns", to: :equalcolumns
      map_attribute "equalrows", to: :equalrows
      map_attribute "fence", to: :fence
      map_attribute "form", to: :form
      map_attribute "frame", to: :frame
      map_attribute "framespacing", to: :framespacing
      map_attribute "groupalign", to: :groupalign
      map_attribute "height", to: :height
      map_attribute "indentalign", to: :indentalign
      map_attribute "indentalignfirst", to: :indentalignfirst
      map_attribute "indentalignlast", to: :indentalignlast
      map_attribute "indentshift", to: :indentshift
      map_attribute "indentshiftfirst", to: :indentshiftfirst
      map_attribute "indentshiftlast", to: :indentshiftlast
      map_attribute "indenttarget", to: :indenttarget
      map_attribute "largeop", to: :largeop
      map_attribute "leftoverhang", to: :leftoverhang
      map_attribute "length", to: :length
      map_attribute "linebreak", to: :linebreak
      map_attribute "linebreakmultchar", to: :linebreakmultchar
      map_attribute "linebreakstyle", to: :linebreakstyle
      map_attribute "lineleading", to: :lineleading
      map_attribute "linethickness", to: :linethickness
      map_attribute "location", to: :location
      map_attribute "longdivstyle", to: :longdivstyle
      map_attribute "lquote", to: :lquote
      map_attribute "lspace", to: :lspace
      map_attribute "mathsize", to: :mathsize
      map_attribute "mathvariant", to: :mathvariant
      map_attribute "maxsize", to: :maxsize
      map_attribute "minlabelspacing", to: :minlabelspacing
      map_attribute "minsize", to: :minsize
      map_attribute "movablelimits", to: :movablelimits
      map_attribute "mslinethickness", to: :mslinethickness
      map_attribute "notation", to: :notation
      map_attribute "numalign", to: :numalign
      map_attribute "open", to: :open
      map_attribute "position", to: :position
      map_attribute "rightoverhang", to: :rightoverhang
      map_attribute "rowalign", to: :rowalign
      map_attribute "rowlines", to: :rowlines
      map_attribute "rowspacing", to: :rowspacing
      map_attribute "rowspan", to: :rowspan
      map_attribute "rquote", to: :rquote
      map_attribute "rspace", to: :rspace
      map_attribute "selection", to: :selection
      map_attribute "separator", to: :separator
      map_attribute "separators", to: :separators
      map_attribute "shift", to: :shift
      map_attribute "side", to: :side
      map_attribute "stackalign", to: :stackalign
      map_attribute "stretchy", to: :stretchy
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "superscriptshift", to: :superscriptshift
      map_attribute "symmetric", to: :symmetric
      map_attribute "valign", to: :valign
      map_attribute "width", to: :width
      map_attribute "fontfamily", to: :fontfamily
      map_attribute "fontweight", to: :fontweight
      map_attribute "fontstyle", to: :fontstyle
      map_attribute "fontsize", to: :fontsize
      map_attribute "color", to: :color
      map_attribute "background", to: :background
      map_attribute "veryverythinmathspace", to: :veryverythinmathspace
      map_attribute "verythinmathspace", to: :verythinmathspace
      map_attribute "thinmathspace", to: :thinmathspace
      map_attribute "mediummathspace", to: :mediummathspace
      map_attribute "thickmathspace", to: :thickmathspace
      map_attribute "verythickmathspace", to: :verythickmathspace
      map_attribute "veryverythickmathspace", to: :veryverythickmathspace
      SUPPORTED_TAGS.each do |tag|
        map_element tag.to_sym, to: :"#{tag}_value"
      end
    end
    # rubocop:enable Metrics/BlockLength
  end
  # rubocop:enable Metrics/ClassLength
end
