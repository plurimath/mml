# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Fn
        def self.included(klass)
          klass.class_eval do
            attribute :definition_url, :string
            attribute :encoding_value, :string

            xml do
              namespace Mml::Namespace
              element "fn"
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
