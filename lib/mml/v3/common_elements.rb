# frozen_string_literal: true

module Mml
  module V3
    class CommonElements < Mml::CommonElements
      attribute :factorof_value, :factorof, collection: true
      attribute :limit_value, :limit, collection: true
      attribute :tendsto_value, :tendsto, collection: true
      attribute :annotation_value, :annotation, collection: true
      attribute :fn_value, :fn, collection: true
      attribute :reln_value, :reln, collection: true
      attribute :declare_value, :declare, collection: true
      attribute :share_value, :share, collection: true
      attribute :domainofapplication_value, :domainofapplication, collection: true

      xml do
        map_element "factorof", to: :factorof_value
        map_element "limit", to: :limit_value
        map_element "tendsto", to: :tendsto_value
        map_element "annotation", to: :annotation_value
        map_element "fn", to: :fn_value
        map_element "reln", to: :reln_value
        map_element "declare", to: :declare_value
        map_element "share", to: :share_value
        map_element "domainofapplication", to: :domainofapplication_value
      end
    end
  end
end
