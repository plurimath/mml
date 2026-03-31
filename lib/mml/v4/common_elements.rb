# frozen_string_literal: true

require_relative "../common_elements"

module Mml
  module V4
    class CommonElements < Mml::CommonElements
      attribute :a_value, :a, collection: true

      xml do
        map_element "a", to: :a_value
      end
    end
  end
end
