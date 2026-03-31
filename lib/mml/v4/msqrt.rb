# frozen_string_literal: true

module Mml::V4
  class Msqrt < Mml::V3::Msqrt
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "msqrt"
      mixed_content

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
