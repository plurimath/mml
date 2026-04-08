# frozen_string_literal: true

module Mml
  module V4
    class A < CommonElements
      include Base::V4Attributes

      attribute :href, :string
      attribute :hreflang, :string

      xml do
        namespace Namespace
        element "a"
        mixed_content

        map_attribute "href", to: :href
        map_attribute "hreflang", to: :hreflang
      end
    end
  end
end
