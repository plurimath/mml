# frozen_string_literal: true

module Mml::V4
  class Mstack < Mml::V3::Mstack
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :align, :string
    attribute :stackalign, :string
    attribute :charalign, :string
    attribute :charspacing, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "mstack"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "align", to: :align
      map_attribute "stackalign", to: :stackalign
      map_attribute "charalign", to: :charalign
      map_attribute "charspacing", to: :charspacing
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
