# frozen_string_literal: true

module Mml
  module V4
    class Factorof < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Factorof
    end
  end
end
