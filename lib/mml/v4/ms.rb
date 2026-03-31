# frozen_string_literal: true

module Mml::V4
  class Ms < Mml::V3::Ms
    attribute :mathbackground, :string
    attribute :mathvariant, :string
    attribute :fontfamily, :string
    attribute :background, :string
    attribute :fontweight, :string
    attribute :mathcolor, :string
    attribute :fontstyle, :string
    attribute :mathsize, :string
    attribute :fontsize, :string
    attribute :lquote, :string
    attribute :rquote, :string
    attribute :color, :string
    attribute :value, :string
    attribute :dir, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "ms"
      mixed_content

      map_content to: :value
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "mathvariant", to: :mathvariant
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathsize", to: :mathsize
      map_attribute "lquote", to: :lquote
      map_attribute "rquote", to: :rquote
      map_attribute "dir", to: :dir
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
