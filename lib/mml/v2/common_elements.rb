# frozen_string_literal: true

module Mml
  module V2
    class CommonElements < Mml::CommonElements
      attribute :factorof_value, :factorof, collection: true
      attribute :limit_value, :limit, collection: true
      attribute :tendsto_value, :tendsto, collection: true
      attribute :domainofapplication_value, :domainofapplication,
                collection: true
      attribute :logbase_value, :logbase, collection: true
      attribute :fn_value, :fn, collection: true
      attribute :reln_value, :reln, collection: true

      xml do
        map_element "factorof", to: :factorof_value
        map_element "limit", to: :limit_value
        map_element "tendsto", to: :tendsto_value
        map_element "domainofapplication", to: :domainofapplication_value
        map_element "logbase", to: :logbase_value
        map_element "fn", to: :fn_value
        map_element "reln", to: :reln_value
      end
    end
  end
end
