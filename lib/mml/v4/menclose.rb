# frozen_string_literal: true

module Mml::V4
  class Menclose < Mml::V3::Menclose
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :notation, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "menclose"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "notation", to: :notation
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
