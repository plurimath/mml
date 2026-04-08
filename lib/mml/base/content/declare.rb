# frozen_string_literal: true

module Mml
  module Base
    module Content
      # declare makes a symbolic declaration of a mathematical entity.
      module Declare
        def self.included(klass)
          klass.class_eval do
            attribute :definition_url, :string
            attribute :encoding_value, :string
            attribute :type, :string
            attribute :scope, :string
            attribute :nargs, :string
            attribute :occurrence, :string

            xml do
              namespace Mml::Namespace
              element "declare"
              mixed_content

              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :encoding_value
              map_attribute "type", to: :type
              map_attribute "scope", to: :scope
              map_attribute "nargs", to: :nargs
              map_attribute "occurrence", to: :occurrence
            end
          end
        end
      end
    end
  end
end
