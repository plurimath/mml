# frozen_string_literal: true

module Mml
  module Base
    # Common attributes allowed on all MathML elements per W3C MathML Core spec.
    # See: https://w3c.github.io/mathml-core/#global-attributes
    module CommonAttributes
      def self.included(klass)
        klass.class_eval do
          attribute :id, :string
          attribute :xref, :string
          attribute :class_attr, :string
          attribute :style_attr, :string
          attribute :href, :string
          attribute :autofocus, :string
          attribute :nonce, :string
          attribute :tabindex, :string
          attribute :aria_label, :string
          attribute :aria_describedby, :string
          attribute :aria_description, :string
          attribute :aria_details, :string
          attribute :data_other, :string

          xml do
            namespace Mml::Namespace
            map_attribute "id", to: :id
            map_attribute "xref", to: :xref
            map_attribute "class", to: :class_attr
            map_attribute "style", to: :style_attr
            map_attribute "href", to: :href
            map_attribute "autofocus", to: :autofocus
            map_attribute "nonce", to: :nonce
            map_attribute "tabindex", to: :tabindex
            map_attribute "aria-label", to: :aria_label
            map_attribute "aria-describedby", to: :aria_describedby
            map_attribute "aria-description", to: :aria_description
            map_attribute "aria-details", to: :aria_details
            map_attribute "data-other", to: :data_other
          end
        end
      end
    end
  end
end
