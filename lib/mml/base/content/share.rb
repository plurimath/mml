# frozen_string_literal: true

module Mml
  module Base
    module Content
      # share enables referencing and reuse of subexpressions.
      module Share
        def self.included(klass)
          klass.class_eval do
            attribute :href, :string
            attribute :src, :string

            xml do
              namespace Mml::Namespace
              element "share"
              map_attribute "href", to: :href
              map_attribute "src", to: :src
            end
          end
        end
      end
    end
  end
end
