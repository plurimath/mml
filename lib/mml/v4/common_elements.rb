# frozen_string_literal: true

module Mml
  module V4
    class CommonElements < Mml::CommonElements
      attribute :a_value, :a, collection: true
      attribute :fn_value, :fn, collection: true
      attribute :reln_value, :reln, collection: true
      attribute :declare_value, :declare, collection: true
      attribute :share_value, :share, collection: true
      attribute :domainofapplication_value, :domainofapplication, collection: true

      xml do
        map_element "a", to: :a_value
        map_element "fn", to: :fn_value
        map_element "reln", to: :reln_value
        map_element "declare", to: :declare_value
        map_element "share", to: :share_value
        map_element "domainofapplication", to: :domainofapplication_value
      end
    end
  end
end
