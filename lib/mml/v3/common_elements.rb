# frozen_string_literal: true

module Mml
  module V3
    class CommonElements < Mml::CommonElements
      def self.lutaml_default_register
        :mml_v3
      end

      attribute :cbytes_value, :cbytes, collection: true
      attribute :cerror_value, :cerror, collection: true
      attribute :cs_value, :cs, collection: true
      attribute :factorof_value, :factorof, collection: true
      attribute :limit_value, :limit, collection: true
      attribute :tendsto_value, :tendsto, collection: true
      attribute :annotation_value, :annotation, collection: true
      attribute :fn_value, :fn, collection: true
      attribute :reln_value, :reln, collection: true
      attribute :declare_value, :declare, collection: true
      attribute :share_value, :share, collection: true
      attribute :domainofapplication_value, :domainofapplication,
                collection: true
      attribute :logbase_value, :logbase, collection: true

      xml do
        map_element "cbytes", to: :cbytes_value
        map_element "cerror", to: :cerror_value
        map_element "cs", to: :cs_value
        map_element "factorof", to: :factorof_value
        map_element "limit", to: :limit_value
        map_element "tendsto", to: :tendsto_value
        map_element "annotation", to: :annotation_value
        map_element "fn", to: :fn_value
        map_element "reln", to: :reln_value
        map_element "declare", to: :declare_value
        map_element "share", to: :share_value
        map_element "domainofapplication", to: :domainofapplication_value
        map_element "logbase", to: :logbase_value
      end
    end
  end
end
