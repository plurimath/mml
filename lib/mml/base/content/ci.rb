# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Ci
        def self.included(klass)
          klass.class_eval do
            attribute :type, :string
            attribute :definition_url, :string
            attribute :encoding_value, :string
            attribute :value, :string

            xml do
              namespace Mml::Namespace
              element "ci"
              mixed_content

              map_content to: :value
              map_attribute "type", to: :type
              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :encoding_value
            end
          end
        end
      end
    end
  end
end
