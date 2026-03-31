# frozen_string_literal: true

module Mml::V4
  class Mfrac < Mml::V3::Mfrac
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :linethickness, :string
    attribute :numalign, :string
    attribute :denomalign, :string
    attribute :bevelled, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "mfrac"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "linethickness", to: :linethickness
      map_attribute "numalign", to: :numalign
      map_attribute "denomalign", to: :denomalign
      map_attribute "bevelled", to: :bevelled
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
