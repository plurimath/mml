# frozen_string_literal: true

module Mml
  module Base
    # Common attributes allowed on all MathML elements per W3C spec.
    # See: https://www.w3.org/TR/MathML/#sec-common-attributes
    module CommonAttributes
      def self.included(klass)
        klass.class_eval do
          attribute :id, :string
          attribute :xref, :string
          attribute :class_attr, :string
          attribute :style_attr, :string
          attribute :href, :string

          xml do
            namespace Mml::Namespace
            map_attribute "id", to: :id
            map_attribute "xref", to: :xref
            map_attribute "class", to: :class_attr
            map_attribute "style", to: :style_attr
            map_attribute "href", to: :href
          end
        end
      end
    end
  end
end
