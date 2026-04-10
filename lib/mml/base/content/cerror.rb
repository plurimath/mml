# frozen_string_literal: true

module Mml
  module Base
    module Content
      # Cerror content element - error marker containing a csymbol and optional content
      # Used to signal semantic errors in content markup
      module Cerror
        def self.included(klass)
          klass.class_eval do
            attribute :csymbol_value, :csymbol, collection: true

            xml do
              namespace Mml::Namespace
              element "cerror"
              mixed_content
              map_element "csymbol", to: :csymbol_value
            end
          end
        end
      end
    end
  end
end
