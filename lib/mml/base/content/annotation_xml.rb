# frozen_string_literal: true

module Mml
  module Base
    module Content
      # annotation-xml is an XML-encoded annotation for semantic markup.
      # Used within semantics element to embed presentation or other markup.
      module AnnotationXml
        def self.included(klass)
          klass.class_eval do
            attribute :definitionURL, :string
            attribute :annotation_xml_encoding, :string
            attribute :cd, :string
            attribute :name, :string

            xml do
              namespace Mml::Namespace
              element "annotation-xml"
              mixed_content

              map_attribute "definitionURL", to: :definitionURL
              map_attribute "encoding", to: :annotation_xml_encoding
              map_attribute "cd", to: :cd
              map_attribute "name", to: :name
            end
          end
        end
      end
    end
  end
end
