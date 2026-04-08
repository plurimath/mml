# frozen_string_literal: true

module Mml
  module V2
    class Reln < CommonElements
      xml do
        namespace Mml::Namespace
        element "reln"
        mixed_content
      end
    end
  end
end
