# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Cbytes
        def self.included(klass)
          klass.class_eval do
            attribute :encoding_value, :string
            attribute :value, :string

            xml do
              namespace Mml::Namespace
              element "cbytes"

              map_content to: :value
              map_attribute "encoding", to: :encoding_value
            end
          end
        end
      end
    end
  end
end
