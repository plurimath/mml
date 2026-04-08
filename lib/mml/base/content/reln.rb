# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Reln
        def self.included(klass)
          klass.class_eval do
            xml do
              namespace Mml::Namespace
              element "reln"
              mixed_content
            end
          end
        end
      end
    end
  end
end
