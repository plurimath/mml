# frozen_string_literal: true

module Mml
  module V4
    class A < CommonElements
      include Base::V4Attributes

      attribute :hreflang, :string
      attribute :width, :string
      attribute :height, :string

      xml do
        namespace Namespace
        element "a"
        mixed_content

        map_attribute "hreflang", to: :hreflang
        map_attribute "width", to: :width
        map_attribute "height", to: :height
      end
    end
  end
end
