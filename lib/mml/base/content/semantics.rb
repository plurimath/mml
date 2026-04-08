# frozen_string_literal: true

module Mml
  module Base
    module Content
      # The semantics element wraps content with semantic annotations.
      # First child is the annotated content.
      module Semantics
        def self.included(klass)
          klass.class_eval do
            attribute :definition_url, :string
            attribute :semantics_encoding, :string

            xml do
              namespace Mml::Namespace
              element "semantics"
              mixed_content

              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :semantics_encoding
            end
          end
        end
      end
    end
  end
end
