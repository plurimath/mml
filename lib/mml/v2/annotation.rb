# frozen_string_literal: true

module Mml
  module V2
    class Annotation < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Annotation
    end
  end
end
