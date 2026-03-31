# frozen_string_literal: true

module Mml::V4
  class Msub < Mml::V3::Msub
    attribute :mathbackground, :string
    attribute :subscriptshift, :string
    attribute :mathcolor, :string
    attribute :intent, :string
    attribute :arg, :string
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "msub"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "subscriptshift", to: :subscriptshift
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
