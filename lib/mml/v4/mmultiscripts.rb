# frozen_string_literal: true

module Mml
  module V4
    autoload(:Mprescripts, "mml/v4/mprescripts")

    class Mmultiscripts < Mml::V3::Mmultiscripts
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :subscriptshift, :string
      attribute :superscriptshift, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer
      attribute :mprescripts_value, Mprescripts

      xml do
        namespace Namespace
        element "mmultiscripts"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "subscriptshift", to: :subscriptshift
        map_attribute "superscriptshift", to: :superscriptshift
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
        map_element "mprescripts", to: :mprescripts_value
      end
    end
  end
end
