# frozen_string_literal: true

module Mml
  module V4
    class CommonElements < Mml::CommonElements
      def self.lutaml_default_register
        :mml_v4
      end

      attribute :a_value, :a, collection: true
      attribute :fn_value, :fn, collection: true
      attribute :reln_value, :reln, collection: true
      attribute :declare_value, :declare, collection: true
      attribute :share_value, :share, collection: true
      attribute :domainofapplication_value, :domainofapplication,
                collection: true
      attribute :logbase_value, :logbase, collection: true
      attribute :annotation_value, :annotation, collection: true

      xml do
        map_element "a", to: :a_value
        map_element "fn", to: :fn_value
        map_element "reln", to: :reln_value
        map_element "declare", to: :declare_value
        map_element "share", to: :share_value
        map_element "domainofapplication", to: :domainofapplication_value
        map_element "logbase", to: :logbase_value
        map_element "annotation", to: :annotation_value
      end
    end
  end
end
