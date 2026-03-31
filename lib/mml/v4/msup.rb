# frozen_string_literal: true

module Mml::V4
  class Msup < Mml::V3::Msup
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :superscriptshift, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "msup"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "superscriptshift", to: :superscriptshift
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
