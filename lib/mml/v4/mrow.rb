# frozen_string_literal: true

module Mml::V4
  class Mrow < Mml::V3::Mrow
    attribute :mathbackground, :string
    attribute :mathcolor, :string
    attribute :content, :string
    attribute :intent, :string
    attribute :dir, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "mrow"
      mixed_content

      map_content to: :content
      map_attribute "dir", to: :dir
      map_attribute "intent", to: :intent
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
