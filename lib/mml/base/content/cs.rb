# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Cs
        def self.included(klass)
          klass.class_eval do
            include WildcardAttributes

            attribute :value, :string

            xml do
              namespace Mml::Namespace
              element "cs"

              map_content to: :value
            end
          end
        end
      end
    end
  end
end
