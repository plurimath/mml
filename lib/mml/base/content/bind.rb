# frozen_string_literal: true

module Mml
  module Base
    module Content
      # bind represents a binding expression (for v3+).
      # Unlike apply, bind explicitly marks the scope of bound variables.
      module Bind
        def self.included(klass)
          klass.class_eval do
            attribute :definition_url, :string
            attribute :encoding_value, :string

            xml do
              namespace Mml::Namespace
              element "bind"
              mixed_content

              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :encoding_value
            end
          end
        end
      end
    end
  end
end
