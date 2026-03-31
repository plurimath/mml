# frozen_string_literal: true

module Mml
  module V4
    class A < Lutaml::Model::Serializable
      attribute :href, :string
      attribute :hreflang, :string
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :intent, :string
      attribute :arg, :string
      attribute :displaystyle, :string
      attribute :scriptlevel, :integer

      xml do
        namespace Namespace
        element "a"
        mixed_content

        map_attribute "href", to: :href
        map_attribute "hreflang", to: :hreflang
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "scriptlevel", to: :scriptlevel
      end
    end
  end
end
