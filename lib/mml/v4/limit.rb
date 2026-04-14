# frozen_string_literal: true

module Mml
  module V4
    class Limit < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Limit
    end
  end
end
