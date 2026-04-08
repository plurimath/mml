# frozen_string_literal: true

module Mml
  module Base
    module Content
      # annotation is a non-XML annotation for semantic markup.
      # Used within semantics element.
      module Annotation
        def self.included(klass)
          klass.class_eval do
            attribute :definition_url, :string
            attribute :encoding_value, :string
            attribute :value, :string

            xml do
              namespace Mml::Namespace
              element "annotation"

              map_content to: :value
              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :encoding_value
            end
          end
        end
      end
    end
  end
end
