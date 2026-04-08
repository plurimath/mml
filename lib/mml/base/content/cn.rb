# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Cn
        def self.included(klass)
          klass.class_eval do
            attribute :type, :string
            attribute :definition_url, :string
            attribute :enc, :string
            attribute :base, :string
            attribute :value, :string
            attribute :sep_value, :sep, collection: true

            xml do
              namespace Mml::Namespace
              element "cn"
              mixed_content

              map_content to: :value
              map_element "sep", to: :sep_value
              map_attribute "type", to: :type
              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :enc
              map_attribute "base", to: :base
            end
          end
        end
      end
    end
  end
end
