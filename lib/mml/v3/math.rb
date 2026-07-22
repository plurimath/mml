# frozen_string_literal: true

module Mml
  module V3
    class Math < CommonElements
      include Base::Math
      include Base::V3Common

      attribute :overflow, :string

      xml do
        map_attribute "overflow", to: :overflow
      end
    end
    MathWithNamespace = Math
  end
end
